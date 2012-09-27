require 'spec_helper'
describe Domain do

  it "should have a version number" do
    Domain.const_defined?(:VERSION).should be_true
  end

end
