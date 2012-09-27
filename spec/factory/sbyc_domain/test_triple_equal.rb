require 'spec_helper'
module Domain
  describe SByC, "===" do

    it 'returns true when a proper value' do
      (Boolean === true).should be_true
      (Boolean === false).should be_true
    end

    it 'returns false when not a value' do
      (Boolean === 1).should be_false
    end

    it 'returns false when a superclass value that satisfies the predicate' do
      (NegInt === -1).should be_true
    end

    it 'returns false when a superclass value that do not satisfy the predicate' do
      (NegInt === 1).should be_false
    end

  end
end
