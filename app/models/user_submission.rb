# frozen_string_literal: true

class UserSubmission < ApplicationRecord
  has_many_attached :files

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                    length: { in: 10..256 }
end
