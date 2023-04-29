require "rails_helper"

describe FeedbackPolicy do
  let(:user) { nil }
  let(:feedback) { build_stubbed :feedback }
  
  let(:policy) { described_class.new(feedback, user: user) }

  describe "#new" do
    subject { policy.apply(:new?) }

    context "when user is guest" do
      it { is_expected.to eq true }
    end

    context "when user is authorized" do
      let(:user) { build_stubbed :user }

      it { is_expected.to eq false }
    end
  end

  describe "#create" do
    subject { policy.apply(:create?) }

    context "when user is guest" do
      it { is_expected.to eq true }
    end

    context "when user is authorized" do
      let(:user) { build_stubbed :user }

      it { is_expected.to eq false }
    end
  end
end
