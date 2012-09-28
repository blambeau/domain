module Domain
  module Reuse

    def self.new(reuse_domain, predicate = nil, &bl)
      ImplDomain.new [ Methods, class_module(reuse_domain, predicate || bl) ],
                     [ instance_module(reuse_domain) ]
    end

    def self.class_module(reuse_domain, predicate)
      Module.new{
        define_method(:predicate) do
          predicate
        end
        define_method(:domain_check!) do |i|
          domain_error!(i) unless reuse_domain===i
          domain_error!(i) if predicate && !predicate.call(i)
          self
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

    module Methods

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

    end # module Methods

  end # module Reuse
end # module Domain