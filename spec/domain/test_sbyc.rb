require 'spec_helper'
describe Domain, "sbyc" do

  subject{ Domain.sbyc(Integer){|i| i > 0} }

  it{ should be_a(Class) }

  it 'should recognize positive integers' do
    (subject === 10).should be_true
  end

  it 'should not recognize negative integers' do
    (subject === -10).should be_false
  end

end