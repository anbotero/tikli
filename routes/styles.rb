class Tikli # < Sinatra::Base
  get '/styles/:stylesheet.css' do
    scss :"styles/#{params[:stylesheet]}"
  end
end