# frozen_string_literal: true

require "rails_helper"
require "sidekiq/testing"

RSpec.describe ProcessFileWorker, type: :worker do
  let(:user_submission) { create(:user_submission) }

  before do
    create(:object_type, :objects_type_list)
    # Clear the Sidekiq queue before each test
    Sidekiq::Worker.clear_all
  end

  describe "#perform" do
    it "creates a new import record" do
      expect do
        described_class.new.perform(user_submission.files.first.id, user_submission.id)
      end.to change(Import, :count).by(1)
    end

    it "enqueues a job" do
      expect do
        described_class.new.perform(user_submission.files.first.id, user_submission.id)
      end.to change(described_class.jobs, :size).by(1)
    end

    it "performs the job" do
      described_class.new.perform(user_submission.files.first.id, user_submission.id)
      expect { described_class.drain }.to change(Import, :count).by(1)
    end
  end
end
