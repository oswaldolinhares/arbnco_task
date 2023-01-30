# frozen_string_literal: true

class ObjectType < ApplicationRecord
  attribute :properties, :jsonb, default: -> { [] }
  has_many :object_items, dependent: :restrict_with_exception

  validates :name, presence: true
end
