require 'spec_helper'
module Domain
  describe Equalizer, "new" do

    let(:clazz){
      eq = equalizer
      Class.new{
        def initialize(x, y)
          @x, @y = x, y
        end
        attr_reader :x, :y
        include eq
      }
    }

    subject{ clazz.new(1, 2).equality_components }

    context 'with a block' do
      let(:equalizer){ Equalizer.new{ [x] } }

      it{ should eq([1]) }
    end

    context 'with a single name' do
      let(:equalizer){ Equalizer.new(:x) }

      it{ should eq([1]) }
    end

    context 'with a multiple names' do
      let(:equalizer){ Equalizer.new([:x, :y]) }

      it{ should eq([1, 2]) }
    end

  end
end