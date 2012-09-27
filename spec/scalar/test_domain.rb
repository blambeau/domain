require 'spec_helper'
module Domain
  describe Scalar, 'domain' do

    it 'includes third party extensions' do
      Point.should respond_to(:third_party_extension)
    end

  end
end
