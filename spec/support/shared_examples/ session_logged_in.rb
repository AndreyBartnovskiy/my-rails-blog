shared_examples "session logged in" do
  context "when user isn't already logged in yet" do
    let(:user) { nil }

    it { is_expected.to eq false }
  end

  context "when user is already logged in" do
    it { is_expected.to eq true }
  end
end
