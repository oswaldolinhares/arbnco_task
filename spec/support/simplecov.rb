# frozen_string_literal: true

require "simplecov"
require "simplecov-console"
require "simplecov-json"
require "simplecov-lcov"

formatters = [SimpleCov::Formatter::HTMLFormatter, SimpleCov::Formatter::JSONFormatter,
              SimpleCov::Formatter::LcovFormatter, SimpleCov::Formatter::Console]
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(formatters)

if ENV["CIRCLE_ARTIFACTS"]
  dir = File.join("..", "..", "..", ENV["CIRCLE_ARTIFACTS"], "coverage")
  SimpleCov.coverage_dir(dir)
end

SimpleCov.start "rails" do
  add_filter "/vendor/"
  add_filter "/config/"
  add_filter "/spec/"
  add_filter "/db/"
end
