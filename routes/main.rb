require 'slim'
#require 'mongo'

class Tikli < Sinatra::Base
  #db = Mongo::Connection.new.db('tikli')

  get '/' do
    @title = 'Tikli'
    #@coll = db['users']
    slim :main
  end

  get '/login' do
    @title = 'Log in &#8212; Tikli'
    slim :login
  end

  post '/login' do
    redirect '/'
  end

  get '/:userid' do
    
  end

  
end
