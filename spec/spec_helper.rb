$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'domain'

require_relative 'shared/a_domain_class'
require_relative 'shared/a_value_object'

require_relative 'fixtures/neg_int'
require_relative 'fixtures/boolean'
require_relative 'fixtures/point'

module Domain

  def third_party_extension
    true
  end

end

module SpecHelpers
end

RSpec.configure do |c|
  c.include SpecHelpers
end
