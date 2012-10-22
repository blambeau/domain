require 'spec_helper'
module Domain
  describe Union, "<=>" do

    it 'returns 1 when a super domain' do
      (Boolean <=> TrueClass).should eq(1)
    end
    
    it 'returns 0 on itself' do
      (Boolean <=> Boolean).should eq(0)
    end
    
    it 'returns 0 on equivalent' do
      (Boolean <=> Domain.union(TrueClass, FalseClass)).should eq(0)
    end
    
    it 'returns 1 on superset of domains ' do
      (Boolean <=> Domain.union(TrueClass)).should eq(1)
    end

    it 'returns -1 on subset of domains ' do
      (Domain.union(TrueClass) <=> Boolean).should eq(-1)
    end

    it 'returns -1 when compared with Object' do
      (Boolean <=> Object).should eq(-1)
    end

    it 'returns nil when not a super domain' do
      (Boolean <=> Integer).should be_nil
    end

  end
end
