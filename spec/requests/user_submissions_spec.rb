# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/user_submissions" do
  let(:valid_attributes) do
    { email: "example@email.com",
      files: [Rack::Test::UploadedFile.new("spec/files/model.inp", "application/octet-stream")] }
  end

  let(:invalid_attributes) do
    { email: "@email.com", files: nil }
  end

  describe "GET /index" do
    it "renders a successful response" do
      UserSubmission.create! valid_attributes
      get user_submissions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user_submission = UserSubmission.create! valid_attributes
      get user_submission_url(user_submission)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_submission_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new UserSubmission" do
        expect do
          post user_submissions_url, params: { user_submission: valid_attributes }
        end.to change(UserSubmission, :count).by(1)
      end

      it "redirects to the created user_submission" do
        post user_submissions_url, params: { user_submission: valid_attributes }
        expect(response).to redirect_to(user_submission_url(UserSubmission.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new UserSubmission" do
        expect do
          post user_submissions_url, params: { user_submission: invalid_attributes }
        end.not_to change(UserSubmission, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post user_submissions_url, params: { user_submission: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
