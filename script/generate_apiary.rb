require 'json'
require 'erb'

class Object
  def andand
    yield(self) if self
  end
end

class Hash
  def missing_method(name)
    self[name]
  end
end

def process_directory(directory_name)
  Dir.glob("#{directory_name}/*").each do |name|
    if File.directory?(name)
      yield directory if block_given?
      process_directory(name)
    else
      process_file(name)
    end
  end
end

def process_file(filename)
  h = JSON::parse(IO.read(filename))
  yield(filename, h) if block_given?
  h[:title].andand { |title| puts "** #{title}" }
  puts h[:doc]
end

process_directory("spec/requests/apiary/*") do |directory|
  title = directory.split('_').map(&:capitalize).join(' ')
  print <<EOF
  --
    #{title}
  --
EOF
end


