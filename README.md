# Domain - Build data-types the easy way

This gem provides modules (module factories in fact) for creating domains, aka data-types, in a various common ways.

## Links

https://github.com/blambeau/domain

## Scalar domains

A scalar domain has visible components that define the scalar structure of its values. For example a Point domain might have `x` and `y` components.

    # Immediately create a Point class, that is, an implementation of the Point domain
    # This is similar to `Struct.new(:x, :y)`
    Point = Domain.scalar(:x, :y)

    # Another way, if you want to define operators for the Point domain
    class Point
      extend Domain::Scalar.new(:x, :y)

      def distance
        Math.sqrt(x*x + y*y)
      end
    end

    # in either case, `==`, `eql?` and `hash` are implemented in a consistent way
    Point.new(1, 2) == Point.new(1, 2)

## Reuse domains

A domain can also be built by reuse (the current implementation only support reusing a single value) For instance, a List domain could simply be implemented by reusing an Array.

    class List
      extend Domain::Reuse.new(Array)

      def head
        # the reused instance is accessible under `reused_instance` (protected)
        reused_instance.first
      end

      # reuse through delegation to `reused_instance`
      delegate :each, :size, :empty?

      # similar to `delegate` but redecorate the resulting value (will yield Lists)
      reuse :map, :reject, :select
    end

    # The reused instance is expected to be passed at construction time
    List.new [1, 2, 3]

    # `==`, `eql?` and `hash` are already implemented in a consistent way
    List.new([1, 2]) == List.new([1, 2])

## Union domains

A union domain is simply a domain whose values are the union of other domains. The missing Boolean domain can simply be defined as follows:

    # Factors a Boolean domain immediately
    Boolean = Domain.union(TrueClass, FalseClass)

    # or use the module factory in your own class
    class Boolean
      extend Domain::Union.new(TrueClass, FalseClass)
    end

    # in either case, `===` is implemented in a consistent way
    Boolean === true
    Boolean === false

## Specialization by constraints

A domain can also be built through specialization by constraint, that is specifying a predicate that will filter the values of a super domain. For instance:

    # Factors the set of positive integers
    PosInt = Domain.sbyc(Integer){|i| i > 0}

    # or use the module factory (you'll have to extend Integer yourself for consistency)
    class PosInt < Integer
      extend Domain::SByC.new(Integer){|i| i > 0}
    end
