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

def process_directory(directory_name)
  Dir.entries("#{directory_name}").sort { |a, b| a.to_i <=> b.to_i }.each do |name|
    full_name = File.join(directory_name, name)
    #puts "processing #{full_name}"
    case
    when /^\./ =~ name
      next
    when File.directory?(full_name)
      yield name if block_given?
      process_directory(full_name)
    when /.*\.json\z/ =~ name
      process_file(full_name)
    end
  end
end

def process_file(filename)
  h = JSON::parse(IO.read(filename))
  yield(filename, h) if block_given?
  h.title.andand { |title| puts "** #{title}" }
  puts h.description
  h["method"].andand do |method|
    puts "#{method} #{h.url}"
    h.header.map do |header|
	    puts "> #{header.strip}"
    end

		h.parameters.andand do |parameters|
						puts parameters
		end
		puts "< #{h.status}"
    h.response_header.map do |header|
	    puts "< #{header.strip}"
    end
		h.response.andand do |response|
						puts [response, nil, nil]
		end

    
  end
end

process_directory("spec/requests/apiary") do |directory|
  title = directory.sub(/\A\d+_/, '').split('_').map(&:capitalize).join(' ')
  print <<EOF
--
#{title}
--
EOF
end


