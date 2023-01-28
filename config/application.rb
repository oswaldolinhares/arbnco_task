require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module ArbncoTask
  class Application < Rails::Application
    config.load_defaults 7.0
    config.i18n.default_locale = :'pt-BR'
    config.time_zone = 'Brasilia'

    config.active_job.queue_adapter = :sidekiq

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Generate rspec and factories
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, dir: "spec/factories"

      # Disable generation of helpers, javascripts, css, and view specs
      g.helper false
      g.assets false
      g.view_specs false
    end
  end
end
