require 'spec_helper'
module Domain
  describe Reuse, "delegate" do

    let(:object){ List.new([1, 2, 3]) }

    describe "size" do
      subject{ object.size }

      it{ should eq(3) }
    end

    describe "empty?" do
      subject{ object.empty? }

      it{ should be_false }
    end

  end
end
