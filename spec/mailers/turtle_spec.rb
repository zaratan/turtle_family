require "rails_helper"

RSpec.describe TurtleMailer, type: :mailer do
  describe "create" do
    let(:mail) { TurtleMailer.create(create(:turtle)) }

    it "works" do
      TurtleMailer.create(create(:turtle)).deliver_now
    end
  end
end
