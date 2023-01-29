# frozen_string_literal: true

class Import < ApplicationRecord
  belongs_to :user_submission

  delegate :file_name, to: :import_type, prefix: true
  delegate :email, to: :user_submission, prefix: true
end
