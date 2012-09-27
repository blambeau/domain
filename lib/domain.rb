#
# Provide tools for implementing domains (aka data types)
#
module Domain

  # Creates a domain through specialization by constraint
  #
  # @param [Class] superdom
  #   the superdomain of the created domain
  # @param [Proc] pred
  #   the domain predicate
  #
  # @return [Class]
  #   the created domain as a ruby Class
  #
  # @api public
  def self.sbyc(superdom = Object, &pred)
    Class.new(superdom){ extend SByC.new(superdom, pred) }
  end

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

end # module Domain
require_relative 'domain/version'
require_relative 'domain/loader'
require_relative 'domain/support'
require_relative 'domain/union'
require_relative 'domain/sbyc'
require_relative 'domain/scalar'
