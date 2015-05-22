require_relative '../test_helper'

class DashboardTest < FeatureTest
  def test_has_welcome_message
    visit '/'
    within("#header") do
      assert page.has_content?("What Are You Going To Do?")
    end
  end

  def test_it_opens_task_index
    visit '/'
    within('ul #task-index') do
      click_link("What You already have to do...")
      assert_equal "/tasks", current_path
    end
  end

  def test_it_opens_new_task_page
    visit '/'
    within('ul #new_task') do
      click_link("New Stuff To Do...")
      assert_equal "/tasks/new", current_path
    end
  end


end
