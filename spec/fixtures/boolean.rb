class Boolean
  extend Domain::SByC.new(Object, [TrueClass, FalseClass]){|x| x==true || x==false}
end
