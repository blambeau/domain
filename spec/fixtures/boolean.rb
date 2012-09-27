class Boolean
  extend Domain::Union.new(Object, [TrueClass, FalseClass])
end
