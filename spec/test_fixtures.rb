require 'spec_helper'

describe NegInt do
  subject{ NegInt }
  it_should_behave_like 'a domain class'
end

describe Boolean do
  subject{ Boolean }
  it_should_behave_like 'a domain class'
end

describe Point do
  subject{ Point }
  it_should_behave_like 'a domain class'
end

describe List do
  subject{ List }
  it_should_behave_like 'a domain class'
end

describe AttrList do
  subject{ AttrList }

  it_should_behave_like 'a domain class'

  it 'should have OrderedSet helpers' do
    AttrList.new([1, 2, 3]).map{|x| x*2}.should eq(AttrList.new([2, 4, 6]))
  end
end
