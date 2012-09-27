module Domain
  class Scalar < Module

    def initialize(*component_names)
      @component_names = component_names
      define_initialize
      define_component_readers
      define_to_hash_method
      define_equality_methods
    end

  private

    def define_initialize
      component_names = @component_names
      define_method(:initialize) do |*args|
        component_names.zip(args).each do |n,arg|
          instance_variable_set(:"@#{n}", arg)
        end
      end
    end

    def define_component_readers
      @component_names.each do |n|
        define_method(n) do
          instance_variable_get(:"@#{n}")
        end
      end
    end

    def define_to_hash_method
      component_names = @component_names
      define_method(:to_hash) do
        component_names.each_with_object({}) do |n,h|
          h[n] = instance_variable_get(:"@#{n}")
        end
      end
    end

    def define_equality_methods
      component_names = @component_names
      module_eval{ include Equalizer.new(component_names) }
    end

  end # class Scalar
end # module Domain
