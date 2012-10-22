module Domain
  module API

    # Raises a type error for `args`.
    #
    # @param [Array] args
    #   arguments passed to `new` or another factory method
    # @raise TypeError
    #
    # @api protected
    def domain_error!(first, *args)
      first = [first]+args unless args.empty?
      raise TypeError, "Can't convert `#{first.inspect}` into #{self}", caller
    end
    protected :domain_error!

  end # module API
end # module Domain