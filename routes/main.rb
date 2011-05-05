require 'slim'

class Tikli < Sinatra::Base
  get '/' do
    @title = 'Tikli'
    slim :main
  end

  get '/login' do
    @title = 'Log in &#8212; Tikli'
    slim :login
  end

  post '/login' do
    redirect '/'
  end
end
