# vi: ts=2:sts=2:et:sw=2
require 'json'

class Object
  def andand
    yield(self) if self
  end
end

class Hash
  def method_missing(name, *args)
    self[name.to_s].andand do |v|
      if block_given?
        yield(v)
      else 
        v
      end
    end
  end
end

def process_directory(directory_name, directories=[])
  Dir.entries("#{directory_name}").sort { |a, b| a.to_i <=> b.to_i }.each do |name|
    full_name = File.join(directory_name, name)
    #puts "processing #{full_name}"

    case
    when /^\./ =~ name
      next
    when File.directory?(full_name)
      yield name if block_given?
      process_directory(full_name, directories + [name])
    when /.*\.json\z/ =~ name
      process_file(full_name, directories)
    end

  end
end

def create_directory(directories)
  return if directories == []
  FileUtils.mkdir_p(File.join(directories))
end


def title(basename)
  basename.sub(/^\d+_/, '')
end

def require_spec(filename, target)
  filename = $1 if filename =~ /spec\/(.*)\.rb/
    target.puts "require #{filename.inspect}"
end

def process_file(filename, directories=[])
  basename = File.basename(filename, '.*')
  target_file = File.join(directories, "#{basename}_spec.rb")
  h = JSON::parse(IO.read(filename))


  yield(filename, h) if block_given?

  create_directory(directories)
  helper_filename = helper_filename_for(directories)
  generate_helper_file(helper_filename, directories)
  File.open(target_file, 'w') do |target|
    h["title"] ||= title(basename)
    require_spec(helper_filename, target)
    h.post_require { |p| print_lines(target, p) }

    tag_name = directories.last.match(/^[0-9]*_([a-z_]*?)(_resource)?$/)
    tag = tag_name ? ", :#{tag_name[1]} => true" : ""

    target.puts %Q{describe "#{h.title}"#{tag} do}
    target.puts %Q{  include_context "use core context service"}
    h.global_setup do |s|
      print_lines(target, s) { |line| "  #{line}" }
    end

    # Depending of the shape of h, we generate one or many tests
    case 
    when h.examples
      h.examples.each { |example| generate_it_block(example, target) }
    else
      generate_it_block(h, target)
    end

    target.puts 'end'
  end
end                      

def helper_filename_for(directories)
  File.join(directories, 'spec_helper.rb')
end

def generate_helper_file(filename, directories)
  create_needed_file(filename) do |target|
    puts "generating #{filename}"
    parent_file = helper_filename_for(directories[0...-1])
    require_spec(parent_file, target)
    target.puts "# This file will be required by
# all file in this directory and subdirectory
    "
  end
end


  def create_needed_file(filename, &block)
    return if File.exist?(filename)

    File.open(filename, 'w') do |f|
      if block
        block.call(f)
      end
    end
  end
def print_lines(target, string)
        string.split(/[\r\n]/).each do |line|
          target.puts (block_given? ? yield(line) :  line)
        end
end

def generate_it_block(example, target)
    target.puts %Q{  it "#{example.title || example["method"]}" do}
      generate_http_request(example, target)
    target.puts '  end'
end

def generate_http_request(example, target)
    example.description do |d|
      print_lines(target, d) { |line| "  # #{line}" }
    end

  example.setup do |s|
    print_lines(target, s) { |line| "    #{line}" }
  end

  target.puts
  ((example.header || []) + (example.response_header || [])).map do |h|
    key, value = h.split(/:\s/)
    target.puts "    header('#{key}', '#{value}')"
  end

  target.puts
  if example["steps"]
    (example.steps || []).each { |step| generate_http_request(step, target) }

  elsif example["method"]
    method = example["method"].downcase

    if method == 'get'
      target.puts %Q{    response = #{method} #{example.url.inspect}}
    else
      target.puts %Q{    response = #{method} #{example.url.inspect}, <<-EOD}
      parameters = example.parameters ? JSON.parse(example.parameters) : example.request
      target.puts %Q{    #{JSON.pretty_generate(parameters, :indent => '    ')}}
      target.puts "    EOD"
    end
    target.puts %Q{    response.status.should == #{example.status || 200}}
    if example.response
      expected_response = if example.response.is_a?(Hash) 
                            example.response.to_json.gsub(/http:\/\/localhost:9292/, 'http://example.org')
                          else
                            example.response.to_s.gsub(/"\//, '"http://example.org/')
                          end
      target.puts %Q{    response.body.should match_json <<-EOD}
      target.puts %Q{    #{JSON.pretty_generate(JSON.parse(expected_response), :indent => '    ')}}
      target.puts "    EOD"
    end
    target.puts
  elsif example.is_a?(Hash)
    # hash containing differents stages
    # They need to be processed in order
    indexes = example.keys.select { |v| v =~ /\A\d+\z/ }
    indexes.each do |i|
      generate_http_request(example[i], target)
    end
  end
end

create_needed_file('spec/integrations/requests/spec_helper.rb') do |target|
  target.puts "require 'integrations/spec_helper'"
end

process_directory("spec/requests", ["spec/integrations/requests"]) do |directory|
  title = directory.sub(/\A\d+_/, '').split('_').map(&:capitalize).join(' ')
  print <<EOF
  --
    #{title}
--
EOF
end


