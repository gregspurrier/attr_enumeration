require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe AttrEnumeration::SymbolProxy do
  before(:each) do
    klass = AttrEnumeration::SymbolProxy.create([:foo, :bar])
    @proxy = klass.new(:foo)
  end

  it 'should be equal to its underlying symbol' do
    @proxy.should == :foo
  end

  it 'should not be equal to another symbol' do
    @proxy.should_not == :bar
  end

  it "should return true for the underlying symbol's predicate" do
    @proxy.foo?.should == true
  end

  it "should return false for the other predicates" do
    @proxy.bar?.should == false
  end

  it "should respond to the predicates" do
    [:foo?, :bar?].all? {|x| @proxy.respond_to?(x)}.should be_true
  end

  it "should be, in the rspec matcher sense, its underlying symbol" do
    @proxy.should be_foo
  end

  it "should not be, in the rspec matcher sense, another underlying symbol" do
    @proxy.should_not be_bar
  end
end
