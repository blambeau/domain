require 'spec_helper'
module Domain
  describe Union, ">=" do

    it 'returns true when a super domain' do
      (Boolean >= TrueClass).should be_true
    end

    it 'returns true on itself' do
      (Boolean >= Boolean).should be_true
    end

    it 'returns false when not a super domain' do
      (Boolean >= Integer).should be_false
    end

  end
end
