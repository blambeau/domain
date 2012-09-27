module Domain
  module API

    # Returns the domain predicate, nil if no such predicate
    #
    # @return [Proc]
    #   the domain predicate (possibly nil)
    #
    # @api public
    def predicate
      nil
    end

    # Returns the super domain of `self`.
    #
    # @return [Class]
    #   the super domain of `self` as a ruby class
    #
    # @api public
    def super_domain
      superclass
    end

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

  end # module API
end # module Domain