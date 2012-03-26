ENV["RAILS_ENV"] = "test"
$: << File.dirname(__FILE__) + "/../lib" << File.dirname(__FILE__)
require 'rspec'
require "active_support"
require "action_view"
require 'i18n_country_select'
require 'support/fake_app'

RSpec.configure do |config|
  config.mock_with :rspec
  config.fail_fast = true
end
