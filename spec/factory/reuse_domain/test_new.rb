require 'spec_helper'
module Domain
  describe Reuse, "new" do

    it 'returns an instance when correct reused instance' do
      List.new([1, 2, 3]).should be_a(List)
    end

    it 'returns an instance when correct reused instance and valid predicate' do
      Tuple.new(:foo => "bar").should be_a(Tuple)
    end

  end
end
