module Domain
  module Scalar

    def self.new(*component_names)
      i_methods = Module.new{
        include Equalizer.new(component_names)
        define_method(:initialize) do |*args|
          component_names.zip(args).each do |n,arg|
            instance_variable_set(:"@#{n}", arg)
          end
        end
        component_names.each do |n|
          define_method(n) do
            instance_variable_get(:"@#{n}")
          end
        end
        define_method(:to_hash) do
          component_names.each_with_object({}) do |n,h|
            h[n] = instance_variable_get(:"@#{n}")
          end
        end
      }
      Module.new{
        include Domain
        define_singleton_method(:extend_object) do |obj|
          obj.module_eval{ include(i_methods) } if obj.is_a?(Class)
          super(obj)
        end
      }
    end

  end # class Scalar
end # module Domain
