== Description
This ActiveRecord plugin enables attributes to be declared as enumerations
of symbols.

== Example
class TestObject < ActiveRecord::Base
  attr_enumeration :color => [:red, :green, :blue]
end

obj = TestObject.new
obj.color                          # => nil
obj.color = :red                   # => :red
obj.color                          # => :red
obj.color.red?                     # => true
obj.color.green?                   # => false


== Supported Ruby Versions
attr_enumeration has been tested with the following Ruby Versions:
  - 1.8.7
  - 1.9.1
