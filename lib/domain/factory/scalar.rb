module Domain
  module Scalar

    def self.new(*component_names)
      DomainFactory.factor [], instance_module(component_names)
    end

    def self.instance_module(component_names)
      Module.new{
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
        include Equalizer.new(component_names)
      }
    end

  end # class Scalar
end # module Domain
