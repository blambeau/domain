module Domain
  module Comparisons

    def >(other)
      (x = (self <=> other)) && (x > 0)
    end

    def >=(other)
      (x = (self <=> other)) && (x >= 0)
    end

    def <(other)
      (x = (self <=> other)) && (x < 0)
    end

    def <=(other)
      (x = (self <=> other)) && (x <= 0)
    end

  end # module Comparisons
end # module Domain