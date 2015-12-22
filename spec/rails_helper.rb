# This file is copied to spec/ when you run 'rails generate rspec:install'
require "spec_helper"

ENV["RAILS_ENV"] = "test"

require "rails/all"
require "rails/railtie"
require "action_controller"
require "action_controller/railtie"
require "active_support"
require "active_support/railtie"

require "apps/config/application.#{Rails.version.gsub(/\./, "_")}"

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
