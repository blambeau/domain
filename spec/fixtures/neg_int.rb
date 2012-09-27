class NegInt < Integer
  extend Domain::SByC.new(Integer){|i| i<0}
end
