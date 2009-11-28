== Description
This ActiveRecord plugin enables attributes to be declared as enumerations
of symbols.

== Example
class TestObject < ActiveRecord::Base
  # String attribute storing string value of symbol
  attr_enumeration :color => [:red, :green, :blue]

  # Integer attribute with explicit value mapping
  attr_enumeration :level => {:bronze => 1, :silver => 2, :gold => 3}
end

obj = TestObject.new
obj.color                          # => nil
obj.color = :red                   # => :red
obj.color                          # => :red
obj.color.red?                     # => true
obj.color.green?                   # => false

obj.level                          # => nil
obj.level = :silver                # => :silver
obj.level                          # => :silver
obj.level.silver?                  # => true
obj.level.gold?                    # => false

== Getting the Latest Version
The repository for attr_enumeration is hosted at GitHub:
  Web page:   http://github.com/gregspurrier/attr_enumeration
  Clone URL:  git://github.com/gregspurrier/attr_enumeration.git

== Supported Versions
attr_enumeration has been testing with:
  - ActiveRecord 2.3.4
  - Ruby 1.8.7
  - Ruby 1.9.1
