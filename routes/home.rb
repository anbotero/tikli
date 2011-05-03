class Tikli # < Sinatra::Base
  get '/' do
    slim :home
  end
end