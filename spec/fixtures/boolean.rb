class Boolean
  extend Domain::Union.new(TrueClass, FalseClass)
end
