require File.join(File.dirname(__FILE__), 'spec_helper.rb')

shared_examples_for "enumerated attribute" do
  it "should return its value as a symbol" do
    @obj.send(@attr).should == @value
  end

  it "should be true for the matching predicate" do
    predicate = "#{@value}?".to_sym
    @obj.send(@attr).send(predicate).should be_true
  end

  it "should be false for non-matching predicates" do
    predicates = @others.map {|s| "#{s}?".to_sym}
    results = predicates.map {|p| @obj.send(@attr).send(p)}
    results.should_not include(true)
  end
end

describe 'enumeration specified by array of symbols' do
  before(:each) do
    @attr = :color
    @value = :red
    @others = [:green, :blue]
    @obj = TestObject.new(@attr => @value)

  end

  context 'for a new object' do
    it_should_behave_like "enumerated attribute"

    it "should return the assigned value on assignment" do
      result = @obj.color = :green
      result.should == :green
    end

    it "should support assignment to string" do
      @obj.color = 'blue'
      @obj.color.should be_blue
    end

    it "should support assignment to nil" do
      @obj.color = nil
      @obj.color.should be_nil
    end

    it "should be nil for an unassigned attribute" do
      obj = TestObject.new
      obj.color.should be_nil
    end
  end

  context 'for an object loaded from database' do
    before(:each) do
      TestObject.destroy_all
      @obj.save!
      @obj = TestObject.find(@obj.id)
    end

    it_should_behave_like "enumerated attribute"

    it "should be nil for an unassigned attribute" do
      obj = TestObject.create!
      obj = TestObject.find(obj.id)
      obj.color.should be_nil
    end
  end
end

describe 'enumeration specified by hash' do
  before(:each) do
    @attr = :level
    @value = :bronze
    @others = [:silver, :gold]
    @obj = TestObject.new(@attr => @value)
  end

  context 'for a new object' do
    it_should_behave_like "enumerated attribute"

    it "should be nil for an unassigned attribute" do
      obj = TestObject.new
      obj.color.should be_nil
    end
  end

  context 'for an object loaded from database' do
    before(:each) do
      TestObject.destroy_all
      @obj.save!
      @obj = TestObject.find(@obj.id)
    end

    it_should_behave_like "enumerated attribute"

    it "should be nil for an unassigned attribute" do
      obj = TestObject.create!
      obj = TestObject.find(obj.id)
      obj.color.should be_nil
    end
  end
end
