# frozen_string_literal: true

FactoryBot.define do
  factory :object_item do
    import { create(:import) }
    name { Faker::Construction.material }
    object_type { create(:object_type) }
    properties { { teste: "teste" } }
  end
end
