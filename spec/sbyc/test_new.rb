require 'spec_helper'
module Domain
  describe SByC, "new" do

    it 'returns the value when it satisfies the predicate' do
      NegInt.new(-12).should eq(-12)
    end

    it 'raises an argument error when the value does not satisfy the predicate' do
      lambda{
        NegInt.new(12)
      }.should raise_error(ArgumentError)
    end

    it 'raises an argument error when the value is not a superclazz value' do
      lambda{
        NegInt.new("bla")
      }.should raise_error(ArgumentError)
    end

  end
end
