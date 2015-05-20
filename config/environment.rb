require 'bundler'
Bundler.require

# set the pathname for the root of the app
require 'pathname'
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

# require the controller(s)
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }

# require the model(s)
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }

# configure TaskManagerApp settings
class TaskManagerApp < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT.to_path
  set :views, File.join(TaskManagerApp.root, "app", "views")
  set :public_folder, File.join(TaskManagerApp.root, "app", "public")
end


=begin
#Extracts all of this that is currently being required in other individual files into this environment file.
#Similar to test_helper files that we have set up in the past.

require 'bundler'     #gem manager
Bundler.require       #go to Gemfile and require all gems for you

# set the pathname for the root of the app
require 'pathname'
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
  #pathname is part of ruby standard library
  #a way to create a pathname - object that handles the creation
  #made a constant because it won't change

# require the controller(s)
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
  #app_root from above.  join app, controllers and anything that ends in .rb
  #dir gives access to all files as an array
  #iterate through the array and for each file require that file.

# require the model(s)
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }


# configure TaskManagerApp settings
class TaskManagerApp < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT.to_path
  set :views, File.join(TaskManagerApp.root, "app", "features")
  set :public_folder, File.join(TaskManagerApp.root, "app", "public")
end

#set is a Sinatra setting that asks what are you setting and what it it's value.
=end
