require 'spec_helper'
module Domain
  describe Union, "super_domain" do

    it 'returns the super domain passed at construction' do
      Boolean.super_domain.should be(Object)
    end

  end
end
