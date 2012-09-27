$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'domain'
require_relative 'fixtures/neg_int'
require_relative 'fixtures/boolean'

module SpecHelpers
end

RSpec.configure do |c|
  c.include SpecHelpers
end
