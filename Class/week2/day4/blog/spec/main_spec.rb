require './main.rb'
require 'rspec'
require 'rack/test'


describe 'Server service' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'GET /' do
    it 'returns 200 OK' do
      get '/'
      expect(last_response).to be_ok
    end
  end
end
