shared_examples_for 'a domain class' do

  it{ should be_a(Class)  }

  it{ should respond_to(:third_party_extension) }

end