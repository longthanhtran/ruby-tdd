$:.unshift(File.dirname(__FILE__) + "../../")

require 'sinatra'
require 'app'
require 'rack/test'

set :environment, :test

describe App do
  include Rack::Test::Methods

  def app
    App
  end

  describe "First test with Sinatra" do
    it "says Hello World" do
      get "/"

      expect(last_response.status).to eq(200)
      expect(last_response.body).to match(/Hello World/)
    end
  end

  describe "Teams" do
    it "allows to create teams" do
      skip
      get "/teams/new"
      expect(last_response.body).to match(/<h1>New team<\/h1>/)
    end

    it "creates teams" do
      skip
      post "/teams", { name: "Random" }
      follow_redirect!

      expect(last_response.body).to match(/Created team "Random"/)
    end
  end
end
