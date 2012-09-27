shared_examples_for 'a domain class' do

  it{ should be_a(Class)  }

  it{ should respond_to(:predicate) }
  it{ should respond_to(:sub_domains) }
  it{ should respond_to(:super_domain) }

  it{ should respond_to(:third_party_extension) }

end