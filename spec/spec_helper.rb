require 'rubygems'

ENV['RACK_ENV'] ||= 'test'
require 'rack/test'

$LOAD_PATH.unshift File.expand_path('../../', __FILE__)
require 'app'

Dir[File.join(File.dirname(__FILE__), 'support', '**/*.rb')].each do |file|
  require file
end

def app
  Rack::Builder.parse_file('config.ru').first
end
