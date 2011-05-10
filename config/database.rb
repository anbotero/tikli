require 'mongo_mapper'

configure :development do
  MongoMapper.database = 'tikli_dev'
  Slim::Engine.set_default_options :pretty => true
end

configure :test do
  MongoMapper.database = 'tikli_test'
  Slim::Engine.set_default_options :pretty => true
end

configure :production do
  # MongoMapper.connection = Mongo::Connection.new('mongo.host.com', 27017)
  MongoMapper.database = 'tikli'
  # MongoMapper.database.authenticate(ENV['mongodb_user'], ENV['mongodb_pass'])
end