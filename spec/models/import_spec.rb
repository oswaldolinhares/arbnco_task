# frozen_string_literal: true

require "rails_helper"

RSpec.describe Import do
  it { is_expected.to belong_to(:user_submission) }
end
