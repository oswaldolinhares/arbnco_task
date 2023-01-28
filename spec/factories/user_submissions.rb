# frozen_string_literal: true

FactoryBot.define do
  factory :user_submission do
    email { Faker::Internet.email }
    after :build do |user_submission|
      file_name = "model.inp"
      file_path = Rails.root.join("spec", "files", file_name)
      user_submission.files.attach(io: File.open(file_path), filename: file_name)
    end
  end
end
