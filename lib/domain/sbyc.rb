module Domain
  module SByC

    def self.new(super_domain = Object, predicate = nil, &bl)
      FakeDomain.new(super_domain, [], predicate || bl)
    end

  end # module SByC
end # module Domain
