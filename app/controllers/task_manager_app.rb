class TaskManagerApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')


  get '/' do
    "Hello, Sweetie"
  end

end
