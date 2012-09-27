require 'spec_helper'
module Domain
  describe Union, "sub_domains" do

    it 'returns the sub domains passed at construction' do
      Boolean.sub_domains.should eq([TrueClass, FalseClass])
    end

  end
end
