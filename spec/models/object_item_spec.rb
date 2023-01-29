# frozen_string_literal: true

require "rails_helper"

RSpec.describe ObjectItem do
  it { is_expected.to belong_to(:import) }
  it { is_expected.to belong_to(:object_type) }
end
