# frozen_string_literal: true

FactoryBot.define do
  factory :object_type do
    name do
      %w[WALL WINDOW ZONE HVAC-SYSTEM DHW-GENERATOR GLASS CONSTRUCTION COMPLIANCE GENERAL REC-USER UNIDENTIFIED].sample
    end
    trait :objects_type_list do
      objects_list = %w[WALL WINDOW ZONE HVAC-SYSTEM DHW-GENERATOR GLASS CONSTRUCTION COMPLIANCE GENERAL REC-USER
                        UNIDENTIFIED]
      objects_list.each do |object|
        after(:create) do |_instance|
          create_list(:object_type, 11, name: object)
        end
      end
    end
  end
end
