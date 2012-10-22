require 'spec_helper'
module Domain
  describe SByC, "<=>" do

    it 'detects a super-domain' do
      (NegInt <=> Integer).should eq(-1)
      (NegInt <=> Numeric).should eq(-1)
    end

    it 'detects a non ancestor' do
      (NegInt <=> String).should be_nil
    end

  end
end
