module Domain
  class Union < Module

    def initialize(super_domain, sub_domains)
      predicate = lambda{|t| sub_domains.any?{|d| d===t } }
      @class_module = Module.new{
        include Domain, FakeDomainMethods
        define_method(:super_domain){ super_domain }
        define_method(:sub_domains) { sub_domains  }
        define_method(:predicate)   { predicate    }
      }
    end

    def included(clazz)
      clazz.extend(@class_module)
      super
    end

  end # class Union
end # module Domain

    