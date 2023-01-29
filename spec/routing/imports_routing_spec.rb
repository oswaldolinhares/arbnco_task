# frozen_string_literal: true

require "rails_helper"

RSpec.describe ImportsController do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/imports").to route_to("imports#index")
    end

    it "routes to #show" do
      expect(get: "/imports/1").to route_to("imports#show", id: "1")
    end
  end
end
