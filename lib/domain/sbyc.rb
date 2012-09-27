module Domain
  module SByC

    def self.new(super_domain = Object, predicate = nil, &bl)
      predicate ||= bl
      Module.new{
        include Domain, FakeDomainMethods
        define_method(:super_domain){ super_domain }
        define_method(:sub_domains) { []           }
        define_method(:predicate)   { predicate    }
      }
    end

  end # module SByC
end # module Domain
