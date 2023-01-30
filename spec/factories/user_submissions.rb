# frozen_string_literal: true

FactoryBot.define do
  factory :user_submission do
    email { Faker::Internet.email }
    after :build do |user_submission|
      file_name = "model.inp"
      file_path = Rails.root.join("spec", "files", file_name)
      user_submission.files.attach(io: File.open(file_path), filename: file_name)
    end

    trait :all_files do
      files do
        [
          Rack::Test::UploadedFile.new("spec/files/model.inp", "chemical/x-gamess-input"),
          Rack::Test::UploadedFile.new("spec/files/model-1.inp", "chemical/x-gamess-input"),
          Rack::Test::UploadedFile.new("spec/files/model-2.inp", "chemical/x-gamess-input")
        ]
      end
    end
  end
end
