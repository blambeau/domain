shared_examples_for 'a domain class' do

  it{ should be_a(Class)  }

  it{ should respond_to(:third_party_extension) }

  context 'comparisons' do

    it 'should compare with itself' do
      (subject <=> subject).should eq(0)
    end

    it 'should <= with itself' do
      (subject <= subject).should be_true
    end

    it 'should < with itself' do
      (subject < subject).should be_false
    end

    it 'should >= with itself' do
      (subject >= subject).should be_true
    end

    it 'should > with itself' do
      (subject > subject).should be_false
    end
  end

end