module Domain
  module Reuse

    def self.new(reuse_domain, predicate = nil, &bl)
      predicate = predicate || bl || Domain::TRUE_PREDICATE
      DomainFactory.factor [ Helpers, class_module(reuse_domain, predicate) ],
                           [ instance_module(reuse_domain) ]
    end

    def self.class_module(reuse_domain, predicate)
      Module.new{
        define_method(:predicate) do
          predicate
        end
        define_method(:domain_check!) do |i|
          domain_error!(i) unless reuse_domain===i && predicate.call(i)
        end
      }
    end

    def self.instance_module(reuse_domain)
      Module.new{
        define_method(:initialize) do |arg|
          @reused_instance = arg
        end
        define_method(:reused_instance) do
          @reused_instance
        end
        protected :reused_instance
        include Equalizer.new(:reused_instance)
      }
    end

    module Helpers

      def reuse(*methods)
        methods.each do |m|
          define_method(m){|*args, &bl| reused_instance.send(m, *args, &bl)}
        end
      end

      def recoat(*methods)
        methods.each do |m|
          define_method(m){|*args, &bl| self.class.new reused_instance.send(m, *args, &bl)}
        end
      end

    end # module Helpers

  end # module Reuse
end # module Domain