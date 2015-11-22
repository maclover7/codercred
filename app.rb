require 'sinatra/base'

# Mongo Setup
require 'mongoid'
Mongoid.load!('config/mongoid.yml', ENV['RACK_ENV'])

module Codercred
  class App < Sinatra::Base
    get '/' do
      'hi'
    end
  end
end
