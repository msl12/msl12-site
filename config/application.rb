require_relative 'boot'

require "rails"

require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Msl12Site
  class Application < Rails::Application

  	config.time_zone = 'Beijing'

  	config.autoload_paths += [Rails.root.join('lib')]
  	config.eager_load_paths += [Rails.root.join('lib/msl12_site')]

  end
end

RAILS_ROOT = File.expand_path('../..', __FILE__) unless defined?(RAILS_ROOT)
APP_CONFIG = YAML.load_file(File.expand_path("#{RAILS_ROOT}/config", __FILE__) + '/app_config.yml')[Rails.env]