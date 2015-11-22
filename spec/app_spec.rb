require 'spec_helper'

describe Codercred::App do
  include Rack::Test::Methods

  describe 'GET /' do
    it 'returns the correct http status' do
      get '/'

      expect(last_response.status).to eq(200)
    end
  end
end
