require 'spec_helper'
module Domain
  describe Reuse, "new" do

    it 'returns an instance when correct reused instance' do
      List.new([1, 2, 3]).should be_a(List)
    end

    it 'raises an ArgumentError when not correct reused instance' do
      lambda{
        List.new("foo")
      }.should raise_error(ArgumentError)
    end

  end
end
