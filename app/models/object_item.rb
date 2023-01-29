# frozen_string_literal: true

class ObjectItem < ApplicationRecord
  belongs_to :import
  belongs_to :object_type
end
