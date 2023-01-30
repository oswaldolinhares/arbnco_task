# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserSubmission do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(10).is_at_most(256) }
  it { is_expected.to allow_value("astolfo@gmail.com").for(:email) }
  it { is_expected.not_to allow_value("@gmail.com").for(:email) }
  it { is_expected.to validate_attached_of(:files) }
  it { is_expected.to validate_content_type_of(:files).allowing("application/octet-stream") }
end
