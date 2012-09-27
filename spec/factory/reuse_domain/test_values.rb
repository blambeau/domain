require 'spec_helper'
module Domain
  describe Reuse, "values" do

    let(:object)        { List.new([1, 2, 3]) }
    let(:another_object){ List.new([2, 3, 4]) }

    it_should_behave_like 'a value object'

  end
end
