require 'spec_helper'
module Domain
  describe SByC, "sub_domains" do

    it 'returns the sub domains passed at construction' do
      Boolean.sub_domains.should eq([TrueClass, FalseClass])
    end

    it 'defaults an empty array' do
      NegInt.sub_domains.should eq([])
    end

  end
end
