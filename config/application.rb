require_relative 'boot'

require "rails/all"
# Pick the frameworks you want:

# require "rails/test_unit/railtie"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KayProfile
  class Application < Rails::Application
    config.load_defaults 5.2
    config.assets.initialize_on_precompile = false
  end
end
