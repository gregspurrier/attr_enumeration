require File.join(File.dirname(__FILE__), 'attr_enumeration/symbol_proxy')
require File.join(File.dirname(__FILE__), 'attr_enumeration/class_methods')

ActiveRecord::Base.extend AttrEnumeration::ClassMethods
