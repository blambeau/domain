require 'spec_helper'
module Domain
  describe Scalar, "to_hash" do

    let(:point){ Point.new(1, 2) }

    subject{ point.to_hash }

    it 'returns a hash with component values' do
      subject.should eq(:x => 1, :y => 2)
    end

  end
end
