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
