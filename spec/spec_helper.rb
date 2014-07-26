ENV["RAILS_ENV"] = "test"
$: << File.dirname(__FILE__) + "/../lib" << File.dirname(__FILE__)
require 'rspec'
require "active_support"
require 'action_view'
require 'i18n_country_select'
require 'rails/all'

RSpec.configure do |config|
  config.mock_with :rspec
  config.fail_fast = true
end


module RbConfig
  class Application < ::Rails::Application
    # configuration here if needed
    config.active_support.deprecation = :stderr
  end
end
 
# Initialize the application
RbConfig::Application.initialize!
