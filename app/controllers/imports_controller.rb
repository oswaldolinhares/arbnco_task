# frozen_string_literal: true

class ImportsController < ApplicationController
  before_action :set_import, only: :show

  # GET /imports or /imports.json
  def index
    @imports = Import.all
  end

  # GET /imports/1 or /imports/1.json
  def show
    respond_to do |format|
      format.html
      format.inp do
        render mime_type: Mime::Type.lookup("application/octet-stream")
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_import
    @import = Import.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def import_params
    params.require(:import).permit(:file_name, :user_submission_id, :fields)
  end
end
