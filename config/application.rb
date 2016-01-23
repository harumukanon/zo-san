# class Application < Rails::Application
  # config.middleware.use Rack::SPARQL::ContentNegotiation
# end

require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
if Rails.env == "development"
  YAML.load(File.read(File.expand_path("secrets.yml", ENV["HOME"]))).each do |k, v|
    ENV[k.to_s] = v.to_s
  end
end

module ZoshoinDb
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end

module RailsI18n
  class Application < Rails::Application
    config.i18n.available_locales = %i(ja en zh-TW)
    config.i18n.enforce_available_locales = false
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  end
end
