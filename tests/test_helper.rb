
ENV['TASK_MANAGER_ENV'] ||= 'test'
  #Sets up the environment for Test Environment
  #name can be different
  #use test environment database instead of production database

require File.expand_path("../../config/environment", __FILE__)
  #so we have access to the environment
require 'minitest/autorun'
require 'minitest/pride'

class ModelTest < Minitest::Test
  def teardown
    TaskManager.delete_all
  end
end

