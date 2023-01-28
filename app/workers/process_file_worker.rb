# frozen_string_literal: true

class ProcessFileWorker
  include Sidekiq::Worker

  def perform(file_id, email, last_file_id); end
end
