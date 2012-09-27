require 'spec_helper'
module Domain
  describe Scalar, "== and eql?" do

    let(:point){ Point.new(1, 2) }

    describe "==" do
      subject{ point == other }

      context 'with itself' do
        let(:other){ point }

        it{ should be_true }
      end

      context 'with a dup' do
        let(:other){ point.dup }

        it{ should be_true }
      end

      context 'with an equivalent' do
        let(:other){ Point.new(1, 2) }

        it{ should be_true }
      end

      context 'with a different' do
        let(:other){ Point.new(2, 1) }

        it{ should be_false }
      end
    end

    describe "eql?" do
      subject{ point.eql?(other) }

      context 'with itself' do
        let(:other){ point }

        it{ should be_true }
      end

      context 'with a dup' do
        let(:other){ point.dup }

        it{ should be_true }
      end

      context 'with an equivalent' do
        let(:other){ Point.new(1, 2) }

        it{ should be_true }
      end

      context 'with a different' do
        let(:other){ Point.new(2, 1) }

        it{ should be_false }
      end
    end

  end
end
