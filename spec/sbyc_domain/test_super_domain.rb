require 'spec_helper'
module Domain
  describe SByC, "super_domain" do

    it 'returns the super domain passed at construction' do
      NegInt.super_domain.should be(Integer)
    end

  end
end
