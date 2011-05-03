require 'sinatra/base'
require 'slim'
require 'mongo'
#require 'models'

before do
  puts '[Params]'
  p params
end

class Tikli < Sinatra::Base
  enable :sessions

  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
  end
end

require_relative 'app/'

get '/' do
  slim :index
end

get '/user/:message' do
	#connection = Mongo::Connection.new
	#connection.database_names.each {|name| puts name}
	#connection.database_info.each {|info| puts info.inspect}
	# redirect to('/:user')
	# "you posted something"
	"You wrote '#{params[:message]}'"
end

not_found do
	halt 404, 'You\'re out of luck: Page not found.'
end

error do
  'Nasty error: ' + env['sinatra.error'].name
end


##########################
require 'sinatra'
require 'slim'
#require 'mongo'
#require 'models'

before do
  puts '[Params]'
  p params
end

class Tikli < Sinatra::Base
  enable :sessions

  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
  end
end

require_relative 'app/**/*.rb'