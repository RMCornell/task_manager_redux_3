require_relative '../test_helper'

class TaskManagerTest < ModelTest
  def test_it_creates_a_task
    data = {:title => 'do something',
            :description => 'still doing something'}

    TaskManager.create(data)
    task = TaskManager.find(1)

    assert_equal 'do something', task.title
    assert_equal 'still doing something', task.description
    assert_equal 1, task.id
  end
end
