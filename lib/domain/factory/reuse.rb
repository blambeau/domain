module Domain
  module Reuse

    def self.new(reuse_domain)
      ImplDomain.new Methods, instance_module(reuse_domain)
    end

    def self.instance_module(reuse_domain)
      Module.new{
        define_method(:initialize) do |arg|
          raise ArgumentError unless reuse_domain===arg
          @reused_instance = arg
        end
        define_method(:reused_instance) do
          @reused_instance
        end
        protected :reused_instance
        include Equalizer.new(:reused_instance)
      }      
    end

    module Methods

      def delegate(*methods)
        methods.each do |m|
          define_method(m) do |*args, &bl|
            reused_instance.send(m, *args, &bl)
          end
        end
      end

      def reuse(*methods)
        methods.each do |m|
          define_method(m) do |*args, &bl|
            self.class.new reused_instance.send(m, *args, &bl)
          end
        end
      end

    end # module Methods

  end # module Reuse
end # module Domain