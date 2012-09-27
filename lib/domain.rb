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
  def self.sbyc(superdom = Object, subdoms = [], &pred)
    Class.new(superdom){ include SByC.new(superdom, subdoms, pred) }
  end

end # module Domain
require_relative 'domain/version'
require_relative 'domain/loader'
require_relative 'domain/support/equalizer'
require_relative 'domain/sbyc'
require_relative 'domain/scalar'
