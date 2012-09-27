module Domain
  module Union

    def self.new(super_domain, sub_domains)
      predicate = lambda{|t| sub_domains.any?{|d| d===t } }
      FakeDomain.new(super_domain, sub_domains, predicate)
    end

  end # class Union
end # module Domain

    