# frozen_string_literal: true

class ObjectType < ApplicationRecord
  validates :name, presence: true
end
