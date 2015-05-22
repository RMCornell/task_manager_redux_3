require 'sequel'
require 'database_cleaner'

class TaskManager
  def self.database
    if ENV["TASK_MANAGER_ENV"] == 'test'
      @database ||= Sequel.sqlite('db/task_manager_test.sqlite3')
    else
      @database ||= Sequel.sqlite('db/task_manager.sqlite3')
    end
  end

  def self.create(task)
    database.from(:tasks).insert(:title => task[:title], :description => task[:description])
  end

  def self.all
    database.from(:tasks).map do |data|
      Task.new(data)
    end
  end

  def self.find(id)
    task = database.from(:tasks).where(:id => id)
    Task.new(task.to_a.last)
  end

  def self.update(id, task)
   database.from(:tasks).where(id: id).update(task)
  end

  def self.delete(id)
    database.from(:tasks).where(:id => id).delete
  end

  def self.delete_all
    DatabaseCleaner.clean
  end
end
