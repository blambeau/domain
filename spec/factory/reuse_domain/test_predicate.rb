require 'spec_helper'
module Domain
  describe Reuse, "predicate" do

    it 'returns a Proc' do
      Tuple.predicate.should be_a(Proc)
    end

  end
end
