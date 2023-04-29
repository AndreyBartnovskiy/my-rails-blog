require "rails_helper"

describe PublicationPolicy do
  let(:user) { build_stubbed :user }
  let(:article) { build_stubbed :article }
  
  let(:policy) { described_class.new(article, user: user) }

  describe "#create?" do
    subject { policy.apply(:create?) }

    context "when user is owner of article" do
      let(:article) { build_stubbed :article, user: user }

      it { is_expected.to eq true }
    end

    context "when user is admin" do
      let(:user) { build_stubbed :user, :admin }

      it { is_expected.to eq true }
    end

    context "when user isn't admin or not owner of article" do
      it { is_expected.to eq false }
    end
  end

  describe "#destroy?" do
    subject { policy.apply(:destroy?) }

    context "when user is owner of article" do
      let(:article) { build_stubbed :article, user: user }

      it { is_expected.to eq true }
    end

    context "when user is admin" do
      let(:user) { build_stubbed :user, :admin }

      it { is_expected.to eq true }
    end

    context "when user isn't admin and owner of article" do
      it { is_expected.to eq false }
    end
  end
end
