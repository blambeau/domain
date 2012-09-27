require 'spec_helper'
module Domain
  describe Reuse, "new" do

    it 'returns an instance when correct reused instance' do
      List.new([1, 2, 3]).should be_a(List)
    end

    it 'returns an instance when correct reused instance and valid predicate' do
      Tuple.new(:foo => "bar").should be_a(Tuple)
    end

    it 'raises an ArgumentError when not correct reused instance' do
      lambda{
        List.new("foo")
      }.should raise_error(ArgumentError)
    end

    it 'raises an ArgumentError when the predicate is not satisfied' do
      lambda{
        Tuple.new("foo" => :bar)
      }.should raise_error(ArgumentError)
    end

  end
end
