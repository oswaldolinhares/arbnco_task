# frozen_string_literal: true

class ProcessFileWorker
  include Sidekiq::Worker

  def perform(file_id, user_submission_id)
    UserSubmissions::ProcessFile.call(file_id, user_submission_id)
  end
end
