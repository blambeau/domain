require 'spec_helper'
module Domain
  describe Union, "super_domain_of?" do

    it 'returns true when a super domain' do
      Boolean.should be_super_domain_of(TrueClass)
    end

    it 'returns false on itself' do
      Boolean.should_not be_super_domain_of(Boolean)
    end

    it 'returns false when not a super domain' do
      Boolean.should_not be_super_domain_of(Integer)
    end

  end
end
