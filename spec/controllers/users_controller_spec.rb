require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #show' do
    context 'valid user' do
      it 'returns http 200' do
        @user = FactoryGirl.create(:user)
        get :show, username: @user.username
        expect(response.status).to eq(200)
      end
    end

    context 'invalid user' do
      it 'returns http 404' do
        expect do
          get :show, username: 'fakeuser'
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
