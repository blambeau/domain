module Domain
  module FakeDomain

    def self.new(super_domain, sub_domains, predicate)
      Module.new{
        include Domain, Methods
        define_method(:super_domain){ super_domain }
        define_method(:sub_domains) { sub_domains  }
        define_method(:predicate)   { predicate    } if predicate
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
  end # module FakeDomain
end # module Domain
