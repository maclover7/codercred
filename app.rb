require 'sinatra/base'

# Mongo Setup
require 'mongoid'
Mongoid.load!('config/mongoid.yml', ENV['RACK_ENV'])

module Codercred
  class App < Sinatra::Base
    get '/' do
      erb :index
    end
  end
end
