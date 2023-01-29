# frozen_string_literal: true

class UserSubmission < ApplicationRecord
  has_many :imports, dependent: :restrict_with_exception
  has_many_attached :files

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                    length: { in: 10..256 }

  after_save :process_files

  private

  def process_files
    files.each do |file|
      ProcessFileWorker.perform_async(file.id, id)
    end
  end
end
