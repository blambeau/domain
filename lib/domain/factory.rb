require_relative 'factory/union'
require_relative 'factory/sbyc'
require_relative 'factory/scalar'
require_relative 'factory/reuse'
module Domain
  module Factory
    
    # Creates a domain through specialization by constraint
    #
    # @param [Class] super_domain
    #   the super_domain of the factored domain
    # @param [Proc] pred
    #   the domain predicate
    #
    # @return [Class]
    #   the created domain as a ruby Class
    #
    # @api public
    def sbyc(super_domain = Object, &pred)
      Class.new(super_domain){ extend SByC.new(super_domain, pred) }
    end

    # Factors a union domain
    #
    # @param [Class] super_domain
    #   the super_domain of the factored domain
    # @param [Array] sub_domains
    #   an array of sub domains for the factored domain
    #
    # @return [Class]
    #   the created domain as a ruby Class
    #
    # @api public
    def union(*sub_domains)
      Class.new{ extend Union.new(*sub_domains) }
    end

    # Factors a scalar domain
    #
    # @param [Array] component_names
    #   the component names as an array of symbols
    #
    # @return [Class]
    #   the created domain as a ruby Class
    #
    # @api public
    def scalar(*component_names)
      Class.new{ extend Scalar.new(*component_names) }
    end

  end # module Factory
end # module Domain