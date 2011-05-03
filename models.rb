# Libraries
require 'sinatra/base'
require 'sass'
require 'coffee-script'

# Models
class SassHandler < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/views/scss'
    
  get '/styles/*.css' do
    filename = params[:splat].first
    scss filename.to_sym
  end    
end

class CoffeeHandler < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/views/coffee'

  get "/scripts/*.js" do
    filename = params[:splat].first
    coffee filename.to_sym
  end
end


# Application
class Tikli
  use SassHandler
  use CoffeeHandler
    
  # Configuration
  # set :public, File.dirname(__FILE__) + '/public'
  # set :views, File.dirname(__FILE__) + '/views'

end

#if __FILE__ == $0
#  Tikli.run! :port => 4567
#end
