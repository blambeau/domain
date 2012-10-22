module Domain
  module API

    # Returns the sub domains of `self`.
    #
    # @return [Array]
    #   an array of sub domains (possibly empty)
    #
    # @api public
    def sub_domains
      []
    end

    # Returns true if this domain is a super domain of `dom`.
    #
    # @param [Class] dom
    #   a domain
    #
    # @return [Boolean]
    #   true if self is a super domain of `dom`, false otherwise
    #
    # @api public
    def super_domain_of?(dom)
      sub_domains.include?(dom)
    end

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