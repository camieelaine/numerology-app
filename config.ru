require 'sinatra/base'
require 'sinatra'
require 'rake'

require ::File.expand_path('../app', __FILE__)

use Sinatra do
set :app_file, __FILE__

configure do
set :views, File.join(Sinatra::Application.root, "app", "views")
end
end

run Sinatra::Application