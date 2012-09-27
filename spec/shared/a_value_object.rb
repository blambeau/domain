shared_examples_for "a value object" do

  describe "==" do
    subject{ object == other }

    context 'with itself' do
      let(:other){ object }

      it{ should be_true }
    end

    context 'with an equivalent' do
      let(:other){ object.dup }

      it{ should be_true }
    end

    context 'with a different' do
      let(:other){ another_object }

      it{ should be_false }
    end
  end

  describe "eql?" do
    subject{ object.eql?(other) }

    context 'with itself' do
      let(:other){ object }

      it{ should be_true }
    end

    context 'with an equivalent dup' do
      let(:other){ object.dup }

      it{ should be_true }
    end

    context 'with a different' do
      let(:other){ another_object }

      it{ should be_false }
    end
  end

  describe "hash" do

    it 'stays the same when dupped' do
      object.hash.should eq(object.dup.hash)
    end

    it 'is not equal to the other one' do
      object.hash.should_not eq(another_object.hash)
    end
  end

end