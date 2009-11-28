module AttrEnumeration
  module ClassMethods
    # Declare an attribute as being symbolic and specify its possible
    # symbols. E.g.:
    #
    #   attr_enumeration :color => [:red, :green, :blue]
    def attr_enumeration(symbol_sets)
      symbol_sets.each do |attr_name, mapping|
        unless mapping.kind_of?(Hash)
          # Turn the provided array into a hash mapping symbols to their
          # string equivalents
          mapping = Hash[*mapping.zip(mapping.map(&:to_s)).flatten]
        end
        inverse_mapping = mapping.invert

        # Generate a reader method that returns a symbol proxy
        proxy_class = AttrEnumeration::SymbolProxy.create(mapping.keys)
        define_method attr_name,
            lambda {
              attr = read_attribute(attr_name)
              if attr
                proxy_class.new(inverse_mapping[attr])
              end
            }

        # Generate a writer method that takes symbols
        writer_sym = "#{attr_name}=".to_sym
        define_method writer_sym,
            lambda { |value|
              value = value.to_sym if value
              write_attribute(attr_name, mapping[value])
            }
      end
    end
  end
end
