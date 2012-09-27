module Domain
  class SByC < Module

    def initialize(super_domain = Object, sub_domains = [], predicate = nil, &bl)
      predicate ||= bl
      @class_module = Module.new{
        include Domain, TypeMethods
        define_method(:super_domain){ super_domain }
        define_method(:sub_domains){ sub_domains }
        define_method(:predicate){ predicate }
      }
    end

    def included(clazz)
      clazz.extend(@class_module)
      super
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
