# Stream to build a *structure*, ie Hash or Array
# Allow to create a nested structure in a *flat* way.
# This is so far a naive implementation without state and only basic checks.
module Lims::Api
  class StructStream
    class HashStream
      attr_reader :struct
      def initialize
        @struct = {}
        @key = nil
      end

      def add_key(key)
        raise RuntimeError, "Expecting a value" if @key
        @key = key
      end

      def add_value(value)
        raise RuntimeError, "Expecting a key" unless @key
        @struct[@key] = value
        @key = nil
      end

    end

    class ArrayStream
      attr_reader :struct
      def initialize
        @struct = []
      end

      def add_key(key)
        raise RuntimeError, "Array not expecting key"
      end

      def add_value(value)
        @struct << value
      end
    end

      attr_reader :struct
    def initialize
      @stack = []
      @struct = nil
    end


    def push(sub_stream)
      @stack << sub_stream
    end

    def current
      @stack.last
    end

    def pop
      @stack.pop
    end

    def start_hash
      push(HashStream.new)
    end

    def start_array
      push(ArrayStream.new)
    end

    def add_key(key)
      current.add_key(key)
    end

    def add_value(value)
      current.add_value(value)
    end

    def end_array
      end_struct
    end

    def end_hash
      end_struct
    end

    def end_struct
      sub_struct = current.struct
      pop
      if current
        current.add_value(sub_struct)
      else
        @struct = sub_struct
      end
    end
  end
end
