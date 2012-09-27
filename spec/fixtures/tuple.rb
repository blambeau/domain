class Tuple
  extend Domain::Reuse.new(Hash){|h| h.keys.all?{|k| Symbol===k} }
end