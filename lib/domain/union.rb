module Domain
  module Union

    def self.new(super_domain, sub_domains)
      predicate = lambda{|t| sub_domains.any?{|d| d===t } }
      Module.new{
        include Domain, FakeDomainMethods
        define_method(:super_domain){ super_domain }
        define_method(:sub_domains) { sub_domains  }
        define_method(:predicate)   { predicate    }
      }
    end

  end # class Union
end # module Domain

    