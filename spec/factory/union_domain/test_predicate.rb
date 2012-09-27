require 'spec_helper'
module Domain
  describe Union, "predicate" do

    it 'returns a Proc' do
      Boolean.predicate.should be_a(Proc)
    end

    it 'is satisfied when a valid value' do
      Boolean.predicate.call(true).should be_true
    end

    it 'is not satisfied when an invalid value' do
      Boolean.predicate.call("12").should be_false
    end

  end
end
