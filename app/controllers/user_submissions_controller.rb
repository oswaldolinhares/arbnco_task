# frozen_string_literal: true

class UserSubmissionsController < ApplicationController
  before_action :set_user_submission, only: :show

  # GET /user_submissions or /user_submissions.json
  def index
    @user_submissions = UserSubmission.all
  end

  # GET /user_submissions/1 or /user_submissions/1.json
  def show; end

  # GET /user_submissions/new
  def new
    @user_submission = UserSubmission.new
  end

  # POST /user_submissions or /user_submissions.json
  def create
    @user_submission = UserSubmission.new(user_submission_params)
    # rubocop:disable Rails/I18nLocaleTexts
    respond_to do |format|
      if @user_submission.save
        format.html do
          redirect_to user_submission_url(@user_submission), notice: "User submission was successfully created."
        end
        format.json { render :show, status: :created, location: @user_submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_submission.errors, status: :unprocessable_entity }
      end
    end
    # rubocop:enable Rails/I18nLocaleTexts
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_submission
    @user_submission = UserSubmission.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_submission_params
    params.require(:user_submission).permit(:email, files: [])
  end
end
