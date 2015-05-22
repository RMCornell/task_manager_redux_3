require_relative '../test_helper'

class NewTest < FeatureTest
  def test_fills_in_title_box
    visit '/tasks/new'
    fill_in "task[title]", with: "shit"
    fill_in "task[description]", with: "more shit"
    click_button "submit"

    within(location)  do
      assert page content "shit"
    end
  end

  def test_edit_an_existing_task
    TaskManager.create(title: "some", description: "shit")

    visit '/tasks'
    click_link "Edit"

    assert_equal '/tasks/1/edit', current_path

    fill_in "task[title]", with: "shit"
    fill_in "task[description]", with: "more shit"
    click_link "Update"

    assert page.has_content?("shit")
    assert page.has_content?("more shit")

    refute page.has_content?("some")
    refute page.has_content?("shit")
  end
end

def test_the_tasks_name
  #set up the test (create a method)

  #Follow through workflow including filling in forms

  #assert or refute what you expect to see

  #if changing pages check where your current path is to assert that the link has done it right

  #assert a value with page.has_content?(value) once you have submitted value

  #go through and clean up the mess of css that you have created because that is making things more difficult than it needs to be

  #ps.  The documentation on capybara blows capybara's

  #use refute when deleting or changing tasks and content


end
