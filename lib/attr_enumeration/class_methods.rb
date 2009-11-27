module AttrEnumeration
  module ClassMethods
    # Declare an attribute as being symbolic and specify its possible
    # symbols. E.g.:
    #
    #   attr_enumeration :color => [:red, :green, :blue]
    def attr_enumeration(symbol_sets)
      symbol_sets.each do |attr_name, values|
        proxy_class = AttrEnumeration::SymbolProxy.create(values)
        define_method attr_name,
            lambda {
              attr = read_attribute(attr_name)
              if attr
                proxy_class.new(attr.to_sym)
              end
            }

        writer_sym = "#{attr_name}=".to_sym
        define_method writer_sym,
            lambda { |value| write_attribute(attr_name, value.to_s) }
      end
    end
  end
end
