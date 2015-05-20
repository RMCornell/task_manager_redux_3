require_relative '../test_helper'

class TaskTest < MiniTest::Test
  def test_it_assigns_attributes_correctly
    task = Task.new({ "title" => "god",
                      "description" => "the almighty",
                      "id" => 1})
    assert_equal "god", task.title
    assert_equal "the almighty", task.description
    assert_equal 1, task.id
  end

end
