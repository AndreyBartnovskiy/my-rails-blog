shared_examples "session not logged in yet" do
  context "when user isn't currently logged in yet" do
    let(:user) { nil }

    it { is_expected.to eq true }
  end

  context "when user is already logged in" do
    it { is_expected.to eq false }
  end
end
