module Domain
  module FakeDomainMethods

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

  end
end
