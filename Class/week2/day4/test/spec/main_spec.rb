require '../main.rb'
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

    it 'Includes This is Sparta!' do
      get '/'
      expect(last_response.body).to include("This is Sparta!")
    end
  end

  describe 'GET /redirect' do
    it 'redirects to home' do

      expect(Calculator).to receive(:add).with(1, 2).and_return(3)

      get '/redirect'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/')
    end
  end
end
