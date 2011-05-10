require '../tikli'
require 'minitest/autorun'
require "rack/test"

class MyApp < Sinatra::Base
  helpers do
    def hello_world
      "Bonjour!"
    end
  end
end

class SinatraHelperTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  attr_accessor :app

  def mock_app(&block)
    @app = Class.new(MyApp)
    @app.class_eval(&block)
  end

  def test_hello_world
    mock_app { get('/') { hello_world } }
    get '/'
    assert last_response.body =~ /Bonjour/
  end
end
