module Domain
  module Union

    def self.new(*sub_domains)
      DomainFactory.factor [ Methods, Comparisons, class_module(sub_domains) ]
    end

    def self.class_module(sub_domains)
      Module.new{
        define_method(:sub_domains){ sub_domains }
      }
    end

    module Methods

      # Creates a new instance of this domain
      def new(first = nil, *args)
        return first if args.empty? && self===first
        return new super(first, *args) if superclass.respond_to?(:new) && (superclass != Object)
        domain_error!(first, *args)
      end

      def predicate
        lambda{|value| sub_domains.any?{|d| d===value } }
      end

      # Checks if `value` belongs to this domain
      def ===(value)
        predicate.call(value)
      end

      # Compares with another domain
      def <=>(other)
        mine, yours = sub_domains_of(self), sub_domains_of(other)
        return 0  if self==other || mine==yours
        return -1 if mine.subset?(yours)
        return 1  if mine.superset?(yours)
        super
      end

    private

      def sub_domains_of(x)
        return x.sub_domains.to_set if x.respond_to?(:sub_domains)
        [ x ].to_set
      end

    end # module Methods

  end # class Union
end # module Domain
