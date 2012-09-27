module Domain
  module Union

    def self.new(*sub_domains)
      FakeDomain.new(Object, sub_domains, lambda{|t| sub_domains.any?{|d| d===t } })
    end

  end # class Union
end # module Domain

    