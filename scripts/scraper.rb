describe Array do
  describe "with 3 items" do
    before { @arr = [1, 2, 3] }

    specify { @arr.should_not be_empty }
    specify { @arr.count.should eq(3) }
  end
end

describe Array do
  describe "with 3 items" do
    subject { [1, 2, 3] }

    it { should_not be_empty }
    its(:count) { should eq(3) }
  end
end

rails_admin