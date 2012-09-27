require 'spec_helper'
module Domain
  describe SByC, "predicate" do

    it 'returns a Proc' do
      Boolean.predicate.should be_a(Proc)
    end

  end
end
