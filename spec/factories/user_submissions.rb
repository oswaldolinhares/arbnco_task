# frozen_string_literal: true

FactoryBot.define do
  factory :user_submission do
    email { Faker::Internet.email }
    files { [Rack::Test::UploadedFile.new("spec/files/model.inp", "application/octet-stream")] }

    trait :all_files do
      files do
        [
          Rack::Test::UploadedFile.new("spec/files/model.inp", "application/octet-stream"),
          Rack::Test::UploadedFile.new("spec/files/model-1.inp", "application/octet-stream"),
          Rack::Test::UploadedFile.new("spec/files/model-2.inp", "application/octet-stream")
        ]
      end
    end
  end
end
