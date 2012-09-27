require 'spec_helper'
module Domain
  describe Scalar, "component reader" do

    let(:point){ Point.new(1, 2) }

    it 'has a `x` reader' do
      point.x.should eq(1)
    end

    it 'has a `y` reader' do
      point.y.should eq(2)
    end

  end
end
