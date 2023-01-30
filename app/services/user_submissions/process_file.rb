# frozen_string_literal: true

module UserSubmissions
  class ProcessFile < ApplicationService
    attr_reader :file, :user_submission

    def initialize(file_id, user_submission_id)
      super()
      @user_submission = UserSubmission.find(user_submission_id)
      @file = @user_submission.files.find(file_id)
    end

    def call
      create_imported_file
      create_object_items
      SendGrid::Notify.call(@imported_file, @user_submission.email)
    end

    private

    def create_imported_file
      @imported_file = Import.create(file_name: file.filename.to_s, user_submission: user_submission,
                                     fields: converted_file.pluck(:properties))
    end

    def create_object_items
      ObjectItem.create!(converted_file.map do |hash|
                           hash.tap do |h|
                             h.delete(:user_submission)
                             h[:properties].shift
                             h.merge!(import: @imported_file)
                           end
                         end)
    end

    def converted_file
      @converted_file ||= ConvertFile::InpToHash.call(file, user_submission)
    end
  end
end
