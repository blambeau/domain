require 'spec_helper'
module Domain
  describe Scalar, "values" do

    let(:object)        { Point.new(1, 2) }
    let(:another_object){ Point.new(2, 3) }

    it_should_behave_like 'a value object'

  end
end
