# frozen_string_literal: true

require "rails_helper"

RSpec.describe SendGrid::Notify, type: :service do
  describe ".call" do
    context "when the file was processed" do
      it "sends an email" do
        user_submission = create(:user_submission)
        import = create(:import)

        expect { described_class.call(import, user_submission.email) }
          .to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end
  end
end
