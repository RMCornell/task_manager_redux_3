require_relative '../test_helper'

class EditTest < FeatureTest
  def test_it_has_edit_form
    visit '/tasks/:id/edit'
      page.fill_in 'task[title]', :with => "Task One"
      page.fill_in 'task[description]', :with => "Description One"
      click('submit')
    assert_equal "Task One", task[title]
    assert_equal "Something", current_path
  end


end
