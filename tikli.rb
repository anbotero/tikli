require 'sinatra/base'

class Tikli < Sinatra::Base
  enable :sessions
  set    :app_file, __FILE__

  require_relative 'helpers/init'
  require_relative 'models/init'
  require_relative 'routes/init'

  run! if $0 == app_file
end

#Tikli.run!
