require "rails_helper"

describe SessionPolicy do
  let(:user) { build_stubbed :user }

  let(:policy) { described_class.new(user: user) }

  describe "#create?" do
    subject { policy.apply(:create?) }

    it_behaves_like "session not logged in yet"
  end

  describe "#new?" do
    subject { policy.apply(:new?) }

    it_behaves_like "session not logged in yet"
  end

  describe "#show?" do
    subject { policy.apply(:show?) }

    it_behaves_like "session logged in"
  end

  describe "#update?" do
    subject { policy.apply(:update?) }

    it_behaves_like "session logged in"
  end

  describe "#edit?" do
    subject { policy.apply(:edit?) }

    it_behaves_like "session logged in"
  end

  describe "#destroy?" do
    subject { policy.apply(:destroy?) }

    it_behaves_like "session logged in"
  end
end
