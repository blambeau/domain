module Domain
  module ImplDomain

    def self.new(c_methods = [], i_methods = [])
      i_methods = Array(i_methods)
      c_methods = Array(c_methods).unshift(Domain)
      Module.new{
        include(*c_methods)
        define_singleton_method(:extend_object) do |obj|
          obj.module_eval{ include(*i_methods) } if obj.is_a?(Class)
          super(obj)
        end
      }
    end

  end # module ImplDomain
end # module Domain