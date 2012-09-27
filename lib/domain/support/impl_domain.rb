module Domain
  module ImplDomain

    def self.new(c_methods = [], i_methods = [])
      i_methods = Array(i_methods)
      c_methods = Array(c_methods).unshift(Domain)
      Module.new{
        c_methods.each{|c_m| include(c_m)}
        define_singleton_method(:extend_object) do |obj|
          obj.module_eval{ i_methods.each{|i_m| include(i_m)} } if obj.is_a?(Class)
          super(obj)
        end
      }
    end

  end # module ImplDomain
end # module Domain