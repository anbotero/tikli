# Libraries
require 'sinatra'
require 'slim'
require 'sass'
require 'coffee-script'

# Application
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

class Tikli < Sinatra::Base
    use SassHandler
    use CoffeeHandler
    
    # Configuration
    # set :public, File.dirname(__FILE__) + '/public'
    # set :views, File.dirname(__FILE__) + '/views'

    get '/' do
      slim :index
    end

    post '/' do
    	# "you posted something"
    	"Escribiste '#{params[:mensaje]}'"
    end

    not_found do
    	halt 404, 'La pagina que intentaste acceder no existe.'
    end
end

if __FILE__ == $0
    Tikli.run! :port => 4567
end