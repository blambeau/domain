module Domain
  class Equalizer < Module

    # Parts of this module have been extracted from Virtus, MIT Copyright (c) 2011-2012
    # Piotr Solnica.

    # Creates an Equalizer instance.
    #
    # @param [Proc] bl
    #   the proc to use to extract components that participate to equality
    #
    # @api private
    def initialize(components = nil, &bl)
      extractor = case components
                  when NilClass then bl
                  when Symbol   then proc{ [ send(components) ] }
                  when Array    then proc{ components.map{|n| send(n)} }
                  end
      define_method(:equality_components, &extractor)
      module_eval{ include(Methods) }
    end

    module Methods

      # Returns a hash code for the value
      #
      # @return Integer
      #
      # @api public
      def hash
        equality_components.map{|c| c.hash }.reduce(self.class.hash, :^)
      end

      # Compare the object with other object for equivalency
      #
      # @example
      #   object == other  # => true or false
      #
      # @param [Object] other
      #   the other object to compare with
      #
      # @return [Boolean]
      #
      # @api public
      def ==(other)
        return false unless self.class <=> other.class
        cmp?(__method__, other)
      end
      alias :eql? :==

    private

      def cmp?(comparator, other)
        equality_components.zip(other.equality_components).
                            all?{|l,r| l.send(comparator, r) }
      end

    end # module Methods
  end # class Equalizer
end # module Domain
