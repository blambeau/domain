require 'spec_helper'
module Domain
  describe Reuse, "domain_check!" do

    it 'raises an ArgumentError when not correct reused instance' do
      lambda{
        List.domain_check!('foo')
      }.should raise_error(TypeError)
    end

    it 'raises an ArgumentError when the predicate is not satisfied' do
      lambda{
        Tuple.domain_check!("foo" => :bar)
      }.should raise_error(TypeError)
    end

  end
end