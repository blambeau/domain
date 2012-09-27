module Domain
  module FakeDomain

    def self.new(super_domain, sub_domains, predicate)
      Module.new{
        include Domain, Methods
        define_method(:super_domain){ super_domain }
        define_method(:sub_domains) { sub_domains  }
        define_method(:predicate)   { predicate    }
      }
    end

    module Methods

      # Creates a new instance of this domain
      def new(*args)
        if (args.size == 1) && self===args.first
          return args.first
        elsif superclass.respond_to?(:new)
          return new super(*args)
        end
        args_error_on_new(args)
      end

      # Checks if `value` belongs to this domain
      def ===(value)
        (superclass === value) && predicate.call(value)
      end

    private

      def args_error_on_new(args)
        raise ArgumentError, "Invalid value #{args.join(' ')} for #{self}", caller
      end

    end # module Methods
  end # module FakeDomain
end # module Domain
