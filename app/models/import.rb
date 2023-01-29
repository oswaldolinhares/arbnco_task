# frozen_string_literal: true

class Import < ApplicationRecord
  attribute :fields, :jsonb, default: -> { [] }
  belongs_to :user_submission
  has_many :object_items, dependent: :destroy

  delegate :file_name, to: :import_type, prefix: true
  delegate :email, to: :user_submission, prefix: true
end
