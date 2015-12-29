require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #edit' do
    before do
      @user = FactoryGirl.create(:user)
    end

    context 'valid current_user' do
      before do
        session[:user_id] = @user.id
      end

      it 'returns http 200' do
        get :edit, github_username: @user.github_username
        expect(response.status).to eq(200)
      end
    end

    context 'invalid current_user' do
      before do
        @user2 = FactoryGirl.create(:user)
        session[:user_id] = @user2.id
      end

      it 'redirects to root_path and flashes and error message' do
        get :edit, github_username: @user.github_username
        expect(flash[:error]).to eq("Access denied.")
        expect(response).to redirect_to(root_path)
      end
    end

    context 'no current_user' do
      before do
        session[:user_id] = nil
      end

      it 'redirects to root_path and flashes an error message' do
        get :edit, github_username: @user.github_username
        expect(flash[:error]).to eq("You must be logged in in order to see this page.")
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #show' do
    context 'valid user' do
      it 'returns http 200' do
        @user = FactoryGirl.create(:user)
        get :show, github_username: @user.github_username
        expect(response.status).to eq(200)
      end
    end

    context 'invalid user' do
      it 'returns http 404' do
        expect do
          get :show, github_username: 'fakeuser'
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'PATCH #update' do
    update_attrs = { user: { description: 'hello', facebook_username: 'hello', twitter_username: 'hello' } }
    before do
      @user = FactoryGirl.create(:user)
    end

    context 'valid current_user' do
      before do
        session[:user_id] = @user.id
      end

      it 'redirects user to root_path and flashes a success message' do
        patch :update, github_username: @user.github_username, user: update_attrs
        expect(flash[:success]).to eq("Successfully updated.")
      end

      it 'updates user information' do
        new_attrs = update_attrs.dup
        new_attrs[:description] = 'hi'
        #---
        patch :update, github_username: @user.github_username, user: new_attrs
        @user.reload
        expect(@user.description).to eq('hi')
      end
    end

    context 'invalid current_user' do
      before do
        @user2 = FactoryGirl.create(:user)
        session[:user_id] = @user2.id
      end

      it 'redirects to root_path and flashes and error message' do
        patch :update, github_username: @user.github_username, user: update_attrs
        expect(flash[:error]).to eq("Access denied.")
        expect(response).to redirect_to(root_path)
      end
    end

    context 'no current_user' do
      before do
        session[:user_id] = nil
      end

      it 'redirects to root_path and flashes an error message' do
        patch :update, github_username: @user.github_username, user: update_attrs
        expect(flash[:error]).to eq("You must be logged in in order to see this page.")
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
