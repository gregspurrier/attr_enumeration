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

== Getting the Latest Version
The repository for attr_enumeration is hosted at GitHub:
  Web page:   http://github.com/gregspurrier/attr_enumeration
  Clone URL:  git://github.com/gregspurrier/attr_enumeration.git

== Supported Ruby Versions
attr_enumeration has been tested with the following Ruby Versions:
  - 1.8.7
  - 1.9.1
