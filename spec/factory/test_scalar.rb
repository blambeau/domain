require 'spec_helper'
describe Domain, "scalar" do

  subject{ Domain.scalar(:x, :y) }

  it_should_behave_like 'a domain class'

  it 'should create a class that accepts two components' do
    point = subject.new(1, 2)
    point.x.should eq(1)
    point.y.should eq(2)
  end

end
