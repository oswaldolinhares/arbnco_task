# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/imports" do
  let(:valid_attributes) do
    skip("Add a hash of attributes valid for your model")
  end

  describe "GET /index" do
    it "renders a successful response" do
      Import.create! valid_attributes
      get imports_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      import = Import.create! valid_attributes
      get import_url(import)
      expect(response).to be_successful
    end
  end
end
