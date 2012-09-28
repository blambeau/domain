module Domain
  module DomainFactory

    def self.factor(c_methods = [], i_methods = [])
      i_methods, c_methods = Array(i_methods), Array(c_methods).unshift(Domain)
      Module.new{
        # include all class methods first
        c_methods.each{|c_m| include(c_m) }

        # Ensure that classes that are extended will include all instance methods
        define_singleton_method(:extend_object) do |obj|
          if obj.is_a?(Class)
            obj.module_eval{ i_methods.each{|i_m| include(i_m) } }
          end
          super(obj)
        end
      }
    end

  end # module DomainFactory
end # module Domain