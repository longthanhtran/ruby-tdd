require 'sinatra'
require_relative './app'

use Rack::Deflater

app = App.new

run app
