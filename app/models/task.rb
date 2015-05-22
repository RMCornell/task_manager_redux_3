class Task
  attr_reader :title,
              :description,
              :id,
              :priority

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @description = data[:description]
  end
end
