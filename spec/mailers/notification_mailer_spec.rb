# frozen_string_literal: true

require "rails_helper"

RSpec.describe NotificationMailer do
  describe "notify" do
    let!(:user_submission) { create(:user_submission, email: "oswaldolinhares@gmail.com") }
    let!(:import) { create(:import) }

    it "renders the subject" do
      mail = described_class.with(import: import, email: user_submission.email)
                            .notify.deliver_now

      expect(mail.subject).to eq("The file was processed!")
    end

    it "renders the receiver email" do
      mail = described_class.with(import: import, email: user_submission.email)
                            .notify.deliver_now

      expect(mail.to).to eq([user_submission.email])
    end

    it "renders the sender email" do
      mail = described_class.with(import: import, email: user_submission.email)
                            .notify.deliver_now

      expect(mail.from).to eq(["oswaldolinhares@gmail.com"])
    end
  end
end
