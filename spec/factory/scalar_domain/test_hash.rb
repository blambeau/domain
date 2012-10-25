require 'spec_helper'
module Domain
  describe Scalar, "hash" do

    let(:point){ Point.new(1, 2) }

    subject{ point.hash }

    context 'on an equivalent point, same class' do
      let(:other){ Point.new(1, 2) }

      specify{
        point.hash.should eq(other.hash)
      }
    end

    context 'on an equivalent point, subclass' do
      let(:sub)  { Class.new(Point) }
      let(:other){ sub.new(1, 2)    }

      specify{
        point.hash.should eq(other.hash)
      }
    end

  end
end
