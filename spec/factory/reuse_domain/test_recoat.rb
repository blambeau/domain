require 'spec_helper'
module Domain
  describe Reuse, "recoat" do

    let(:object){ List.new([1, 2, 3]) }

    describe "map" do
      subject{ object.map{|x| x*2} }

      it{ should be_a(List) }
      it{ should eq(List.new([2, 4, 6])) }
    end

    describe "reject" do
      subject{ object.reject{|x| x%2 == 0} }

      it{ should be_a(List) }
      it{ should eq(List.new([1, 3])) }
    end

  end
end
