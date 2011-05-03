class CoffeeHandler < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/views/coffee'

  get "/scripts/*.js" do
    filename = params[:splat].first
    coffee filename.to_sym
  end
end