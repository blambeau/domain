module OrderedSet
  extend Domain::Reuse::Helpers

  reuse  :size
  recoat :map
end

class AttrList
  extend Domain::Reuse.new(Array)
  include OrderedSet

end