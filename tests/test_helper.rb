
ENV['TASK_MANAGER_ENV'] ||= 'test'
  #Sets up the environment for Test Environment
  #name can be different
  #use test environment database instead of production database

require File.expand_path("../../config/environment", __FILE__)
  #so we have access to the environment
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'

require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

class Minitest::Test
  def teardown
    DatabaseCleaner.clean
  end
end

Capybara.app = TaskManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end


