class Boolean
  include Domain::SByC.new(Object, [TrueClass, FalseClass]){|x| x==true || x==false}
end
