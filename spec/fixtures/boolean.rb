class Boolean
  include Domain::Union.new(Object, [TrueClass, FalseClass])
end
