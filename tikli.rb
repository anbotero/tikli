require 'sinatra/base'
require 'slim'

class Tikli < Sinatra::Base
  enable :sessions
  set  :app_file, __FILE__

  get '/' do
    slim :index
  end

  get '/login' do
    slim :login
  end

  post '/login' do
    redirect to('/')
  end

  run! if $0 == app_file
end

#Tikli.run!
