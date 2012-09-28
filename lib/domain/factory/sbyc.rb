module Domain
  module SByC

    def self.new(super_domain = Object, predicate = nil, &bl)
      predicate = predicate || bl || Domain::TRUE_PREDICATE
      ImplDomain.new [ Methods, class_module(super_domain, predicate) ]
    end

    def self.class_module(super_domain, predicate)
      Module.new{
        define_method(:super_domain){ super_domain }
        define_method(:predicate)   { predicate    }
      }
    end

    module Methods

      # Creates a new instance of this domain
      def new(first = nil, *args)
        return first if args.empty? && self===first
        return new super(first, *args) if superclass.respond_to?(:new) && (superclass != Object)
        domain_error!(first, *args)
      end

      # Checks if `value` belongs to this domain
      def ===(value)
        superclass===value && predicate.call(value)
      end

    end # module Methods

  end # module SByC
end # module Domain
