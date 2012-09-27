class List
  extend Domain::Reuse.new(Array)

  delegate :size, :empty?
  reuse :map, :select, :reject
end