class List
  extend Domain::Reuse.new(Array)

  reuse :size, :empty?
  recoat :map, :select, :reject
end