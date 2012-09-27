require 'spec_helper'
describe Domain, "union" do

  subject{ Domain.union(TrueClass, FalseClass) }

  it_should_behave_like 'a domain class'

  it 'should recognize true and false' do
    (subject === true).should be_true
    (subject === false).should be_true
  end

  it 'should not recognize non booleans' do
    (subject === -10).should be_false
  end

end
