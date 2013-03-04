require 'json'

class Object
  def andand
    yield(self) if self
  end
end

class Hash
  def method_missing(name, *args)
    self[name.to_s]
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

def compute_target_file(fullpath, directories, extension)
	basename = File.basename(fullpath, '.*')

	File.join(directories, basename+extension)
end

def create_directory(directories)
	return if directories == []
	FileUtils.mkdir_p(File.join(directories))
end


def process_file(filename, directories=[])
  target_file = compute_target_file(filename, directories, '_spec.rb')
  h = JSON::parse(IO.read(filename))


  yield(filename, h) if block_given?

  create_directory(directories)
  File.open(target_file, 'w') do |target|
	  target.puts <<-EOF
describe "#{h.description}" do
	#{h.keys}
end
EOF
	  
  end
end

process_directory("spec/requests", ["spec/integrations/requests"]) do |directory|
  title = directory.sub(/\A\d+_/, '').split('_').map(&:capitalize).join(' ')
  print <<EOF
--
#{title}
--
EOF
end


