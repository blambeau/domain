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
    Class.new(superdom){ include SByC.new(superdom, pred) }
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
    respond_to?(:sub_domains) && sub_domains.include?(dom)
  end

end # module Domain
require_relative 'domain/version'
require_relative 'domain/loader'
require_relative 'domain/support'
require_relative 'domain/union'
require_relative 'domain/sbyc'
require_relative 'domain/scalar'
