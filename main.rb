# Libraries
require 'sinatra'
require 'slim'

# Application
get '/' do
	slim :index
end

get '/hello/:name' do
	# params[:name]
	# "Hello there #{params[:name]}"
	"Hello there #{params[:name].upcase}"
end

get '/hello/:name/:city' do
	"Hey there #{params[:name]} from #{params[:city]}!"
end

get '/more/*' do
	params[:splat].inspect
end

get '/form' do
	slim :form
end

post '/form' do
	# "you posted something"
	"You said '#{params[:message]}'"
end

get '/secret' do
	slim :secret
end

post '/secret' do
	params[:secret].reverse
end

get '/decrypt/:secret' do
	params[:secret].reverse
end

# get '/*' do
	# status 404
	# 'not found'
# end

not_found do
	halt 404, 'page not found'
end