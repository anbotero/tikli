require 'spec_helper'
require "rack/test"
require 'tikli'

describe Tikli do
  include Rack::Test::Methods

  def app
    Tikli
  end

  it 'should display the login page' do
    get '/'
      
    assert last_response.redirect?, 'response should not redirect'
    last_response.headers['Location'].must_equal 'http://cacareos.com'
  end
end
