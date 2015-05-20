require_relative '../test_helper'

class DashboardTest < FeatureTest
  def test_has_welcome_message
    visit '/'
    within("#header") do
      assert page.has_content?("What Are You Going To Do?")
    end
  end
end
