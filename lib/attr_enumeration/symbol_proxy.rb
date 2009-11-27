module AttrEnumeration
module SymbolProxy
    class BlankSlate
      instance_methods.each {|m| undef_method m unless m =~ /^__|object_id|should|should_not/}
    end

    class Base < BlankSlate
      def initialize(symbol)
        @symbol = symbol
      end

      def method_missing(*args)
        @symbol.__send__(*args)
      end
    end

    def self.create(symbols)
      klass = Class.new(Base)
      predicate_names = []
      symbols.each do |symbol|
        predicate_name = (symbol.to_s + '?').to_sym
        predicate_names << predicate_name
        predicate = lambda { self.to_sym == symbol}
        klass.send(:define_method, predicate_name, predicate)
      end

      klass.send(:define_method, :respond_to?,
        lambda { |m| predicate_names.include?(m) || @symbol.respond_to?(m) })

      klass
    end
  end
end
