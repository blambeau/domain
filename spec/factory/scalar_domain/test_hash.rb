require 'spec_helper'
module Domain
  describe Scalar, "hash" do

    let(:point){ Point.new(1, 2) }

    subject{ point.hash }

    it 'should equal the hash of an equivalent point' do
      subject.should eq(Point.new(1,2).hash)
    end

  end
end
