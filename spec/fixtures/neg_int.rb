class NegInt < Integer
  include Domain::SByC.new(Integer){|i| i<0}
end
