# frozen_string_literal: true

FactoryBot.define do
  factory :import do
    file_name { Faker::File.file_name }
    user_submission { create(:user_submission) }
    fields { { teste: "teste" } }
  end
end
