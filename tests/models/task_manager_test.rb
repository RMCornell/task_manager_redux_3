require_relative '../test_helper'

class TaskManagerTest < MiniTest::Test
  def test_it_creates_a_task
    data = {:title => 'do something',
            :description => 'still doing something'}

    TaskManager.create(data)
    task = TaskManager.find(1)

    assert_equal 'do something', task.title
    assert_equal 'still doing something', task.description
    assert_equal 1, task.id
  end

  def test_it_finds_all_tasks_in_database
    data1 = { :title => 'task one',
              :description => 'description one'}
    data2 = { :title => 'task two',
              :description => 'description two'}
    data3 = { :title       => 'task three',
              :description => 'description three' }

    TaskManager.create(data1)
    TaskManager.create(data2)
    TaskManager.create(data3)
    all = TaskManager.all

    assert_equal 3, TaskManager.all.count

    assert_equal 'task one', all[0].title
    assert_equal 'description one', all[0].description
    assert_equal 1, all[0].id
    assert_equal 'task two', all[1].title
    assert_equal 'description two', all[1].description
    assert_equal 2, all[1].id
  end

  def test_it_finds_an_individual_task
    data1 = { :title       => 'task one',
              :description => 'description one' }
    data2 = { :title       => 'task two',
              :description => 'description two' }
    data3 = { :title       => 'task three',
              :description => 'description three' }

    TaskManager.create(data1)
    TaskManager.create(data2)
    TaskManager.create(data3)

    find = TaskManager.find(3)

    assert_equal 'task three', find.title
    assert_equal 'description three', find.description
    assert_equal 3, find.id
  end

  def test_it_updates_a_task
    data1 = { :title       => 'task one',
              :description => 'description one' }
    data2 = { :title       => 'task two',
              :description => 'description two' }
    data3 = { :title       => 'task three',
              :description => 'description three' }

    TaskManager.create(data1)
    TaskManager.create(data2)
    TaskManager.create(data3)

    find_task = TaskManager.find(1)

    TaskManager.update(1, data3)
    find_task = TaskManager.find(1)

    assert_equal "task three", find_task.title
    assert_equal "description three", find_task.description
    assert_equal 1, find_task.id
  end

  def test_deletes_task
    data1 = { :title       => 'task one',
              :description => 'description one' }
    data2 = { :title       => 'task two',
              :description => 'description two' }
    data3 = { :title       => 'task three',
              :description => 'description three' }

    TaskManager.create(data1)
    TaskManager.create(data2)
    TaskManager.create(data3)

    assert_equal 3, TaskManager.all.count

    TaskManager.delete(3)

    assert_equal 2, TaskManager.all.count

    find_task = TaskManager.find(2)

    assert_equal "task two", find_task.title
    assert_equal "description two", find_task.description
    assert_equal 2, find_task.id
  end
end
