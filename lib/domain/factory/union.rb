module Domain
  module Union

    def self.new(*sub_domains)
      DomainFactory.factor [ Methods, class_module(sub_domains) ]
    end

    def self.class_module(sub_domains)
      Module.new{
        define_method(:sub_domains){ sub_domains }
        define_method(:>) {|other| sub_domains.include?(other)     }
        define_method(:>=){|other| (self > other) || (self==other) }
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

    end # module Methods

  end # class Union
end # module Domain
