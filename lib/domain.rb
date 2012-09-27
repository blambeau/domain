require_relative 'domain/version'
require_relative 'domain/loader'
require_relative 'domain/support'
require_relative 'domain/api'
require_relative 'domain/factory'
require_relative 'domain/union'
require_relative 'domain/sbyc'
require_relative 'domain/scalar'
#
# Provide tools for implementing domains (aka data types)
#
module Domain
  include API
  extend  Factory

end # module Domain
