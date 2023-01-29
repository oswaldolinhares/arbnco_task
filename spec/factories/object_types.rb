# frozen_string_literal: true

FactoryBot.define do
  factory :object_type do
    name do
      %w[WALL WINDOW ZONE HVAC-SYSTEM DHW-GENERATOR GLASS CONSTRUCTION COMPLIANCE GENERAL REC-USER UNIDENTIFIED].sample
    end
  end
end
