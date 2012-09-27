module Domain
  class SByC < Module

    def initialize(super_domain = Object, sub_domains = [], predicate = nil, &bl)
      @super_domain = super_domain
      @sub_domains = sub_domains
      @predicate = predicate || bl
      define
    end

  private

    def define
      define_super_domain_method
      define_sub_domains_method
      define_predicate_method
      include_type_methods
    end

    def define_super_domain_method
      super_domain = @super_domain
      define_method(:super_domain){ super_domain }
    end

    def define_sub_domains_method
      sub_domains = @sub_domains
      define_method(:sub_domains){ sub_domains }
    end

    def define_predicate_method
      predicate = @predicate
      define_method(:predicate){ predicate }
    end

    def include_type_methods
      module_eval{ include TypeMethods }
    end

    module TypeMethods

      # Creates a new instance of this domain
      def new(*args)
        if (args.size == 1) && self===args.first
          return args.first
        elsif superclass.respond_to?(:new)
          return new super(*args)
        end
        args_error_on_new(args)
      end

      # Returns true if clazz if an explicit sub domain of self.
      def super_domain_of?(child)
        sub_domains.include?(child)
      end

      # Checks if `value` belongs to this domain
      def ===(value)
        (superclass === value) && predicate.call(value)
      end

    private

      def args_error_on_new(args)
        raise ArgumentError, "Invalid value #{args.join(' ')} for #{self}", caller
      end

    end # module TypeMethods

  end # module SByC
end # module Domain
