#vi: ts=2:sts=2:sw=2:et
require 'lims-api'

class Module
  def delegate(*names)
    options = names.pop
    names.each do |name|
      line = __LINE__ + 1
      class_eval(%Q{
        def #{name}(*args, &block)
          #{options[:to]}.send(#{name.to_sym.inspect}, *args, &block)
        end
      }, __FILE__, line)
    end
  end
end

class ExampleContextService
  def new(request)
    Context.new
  end

  class Context
    def for_model(name)
      Model
    end

    def for_uuid(uuid)
      Model.new(uuid)
    end
  end

  module StandardEncoder
    def self.included(base)
      base.class_eval do
        attr_reader :object
      end
    end

    def initialize(object)
      @object = object
    end

    def status
      200
    end

    def content_type
      'application/json'
    end
  end

  module Resource
    def encoder_for(mime_types, url_generator)
      Encoder.new(self)
    end

    def action(action)
      Action.new(self, action)
    end

    class Action
      def initialize(resource, name)
        @resource, @name = resource, name
      end

      attr_reader :resource, :name

      def encoder_for(mime_types, url_generator)
        Encoder.new(self)
      end

      class Encoder
        include StandardEncoder
        delegate :resource, :name, :to => :object

        def call
          %Q{{"action":{"resource":{"class":#{resource.class.name.inspect},"name":#{resource.name.inspect}},"name":#{name.inspect}}}}
        end
      end
    end

    class Encoder
      include StandardEncoder
      alias_method(:resource, :object)

      def call
        %Q{{"resource":{"class":#{resource.class.name.inspect},"name":#{resource.name.inspect}}}}
      end
    end
  end

  class Model
    extend Resource
    include Resource

    def initialize(uuid)
      @uuid = uuid
    end

    attr_reader :uuid
    alias_method(:name, :uuid)
  end
end

Lims::Api::Server.configure(:example) do |config|
  config.set :context_service, ExampleContextService.new
end

Lims::Api::Server.configure(:development) do |config|
require 'lims-api/sequel'
require 'lims-api/message_bus'
  store = Lims::Api::Sequel::create_store(:development)
  message_bus = Lims::Api::MessageBus::create_message_bus(:development)
  config.set :context_service, Lims::Api::ContextService.new(store, message_bus)
  config.set :base_url, "http://localhost:9292"
end

run Lims::Api::Server
