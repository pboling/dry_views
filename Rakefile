#!/usr/bin/env rake
require "rubygems"
require "bundler/setup"
require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "appraisal"
require "dry_views"

RSpec::Core::RakeTask.new(:spec)

require "rails"
require "active_support"

task :default => :spec

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)

Bundler::GemHelper.install_tasks
