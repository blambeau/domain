module Domain
  class SByC < Module

    def initialize(super_domain = Object, predicate = nil, &bl)
      predicate ||= bl
      @class_module = Module.new{
        include Domain, FakeDomainMethods
        define_method(:super_domain){ super_domain }
        define_method(:sub_domains) { []           }
        define_method(:predicate)   { predicate    }
      }
    end

    def included(clazz)
      clazz.extend(@class_module)
      super
    end

  end # module SByC
end # module Domain
