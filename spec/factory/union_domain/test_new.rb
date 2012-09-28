require 'spec_helper'
module Domain
  describe Union, "new" do

    it 'returns the value when it satisfies the predicate' do
      Boolean.new(true).should be(true)
      Boolean.new(false).should be(false)
    end

    it 'raises a type when the value is not a superclazz value' do
      lambda{
        Boolean.new("12")
      }.should raise_error(TypeError)
    end

  end
end
