require 'sass'

class Tikli < Sinatra::Base
  get '/styles/:stylesheet.css' do
    scss :"scss/#{params[:stylesheet]}"
  end
end