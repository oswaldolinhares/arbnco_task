# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserSubmissionsController do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/user_submissions").to route_to("user_submissions#index")
    end

    it "routes to #new" do
      expect(get: "/user_submissions/new").to route_to("user_submissions#new")
    end

    it "routes to #show" do
      expect(get: "/user_submissions/1").to route_to("user_submissions#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/user_submissions").to route_to("user_submissions#create")
    end
  end
end
