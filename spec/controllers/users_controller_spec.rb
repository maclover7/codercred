require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #show' do
    it 'returns http success' do
      @user = FactoryGirl.create(:user)
      get :show, username: @user.username
      expect(response.status).to eq(200)
    end
  end
end
