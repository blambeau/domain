require 'spec_helper'
module Domain
  describe SByC, 'domain' do

    it 'includes third party extensions' do
      NegInt.should respond_to(:third_party_extension)
    end

  end
end