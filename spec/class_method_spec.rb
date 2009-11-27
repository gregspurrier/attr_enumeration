require File.join(File.dirname(__FILE__), 'spec_helper.rb')

shared_examples_for "symbolic attribute" do
  it "should return its value as a symbol" do
    @obj.color.should == :red
  end

  it "should be true for the matching predicate" do
    @obj.color.should be_red
  end

  it "should be false for non-matching predicates" do
    @obj.color.should_not be_blue
    @obj.color.should_not be_green
  end
end


describe 'symbolic attribute specified by array of symbols' do
  context 'for a new object' do
    before(:each) do
      @obj = TestObject.new(:color => :red)
    end

    it_should_behave_like "symbolic attribute"

    it "should return the assigned value on assignment" do
      result = @obj.color = :green
      result.should == :green
    end

    it "should be nil for an unassigned attribute" do
      obj = TestObject.new
      obj.color.should be_nil
    end
  end

  context 'for an object loaded from database' do
    before(:each) do
      TestObject.destroy_all
      @obj = TestObject.create!(:color => :red)
      @obj = TestObject.find(@obj.id)
    end

    it_should_behave_like "symbolic attribute"

    it "should be nil for an unassigned attribute" do
      obj = TestObject.create!
      obj = TestObject.find(obj.id)
      obj.color.should be_nil
    end
  end
end
