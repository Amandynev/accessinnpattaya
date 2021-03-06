require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Accessinnpattaya
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework  :rspec,
                        fixtures: false,
                        view_specs: false,
                        helper_specs: false,
                        routing_specs: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.active_job.queue_adapter = :sidekiq
    config.eager_load_paths += %W(#{config.root}/lib)
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en , :fr, :th]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.autoloader = :classic
  end
end
