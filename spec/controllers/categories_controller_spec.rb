require 'rails_helper'

describe CategoriesController, type: :controller do

  describe '#index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end

    it 'returns a 200 response' do
      get :index
      expect(response).to have_http_status '200'
    end
  end

  describe '#show' do
    before do
      @category = FactoryBot.create(:category)
    end

    it 'responds successfully' do
      get :show, params: { id: @category.id }
      expect(response).to be_successful
    end
  end

  describe '#create' do
    before do
      @admin = FactoryBot.create(:admin)
      @user = FactoryBot.create(:user)
      @category_params = FactoryBot.attributes_for(:category)
    end

    context 'as a guest' do
      it 'does not create the category' do
        expect {
          post :create, params: { category: @category_params }
        }.to_not change(Category, :count)
      end

      it 'returns a 302 response' do
        post :create, params: { category: @category_params }
        expect(response).to have_http_status '302'
      end

      it 'redirects to home page' do
        post :create, params: { category: @category_params }
        expect(response).to redirect_to '/'
      end
    end

    context 'as an user' do
      before do
        sign_in @user
      end

      it 'does not create the category' do
        expect {
          post :create, params: { category: @category_params }
        }.to_not change(Category, :count)
      end

      it 'returns a 302 response' do
        post :create, params: { category: @category_params }
        expect(response).to have_http_status '302'
      end

      it 'redirects to home page' do
        post :create, params: { category: @category_params }
        expect(response).to redirect_to '/'
      end
    end

    context 'as an admin' do
      before do
        sign_in @admin
      end

      it 'adds a category' do
        expect {
          post :create, params: { category: @category_params }
        }.to change(Category, :count).by(1)
      end
    end
  end

  describe '#update' do
    before do
      @user = FactoryBot.create(:user)
      @admin = FactoryBot.create(:admin)
      @category = FactoryBot.create(:category)
      @category_params = FactoryBot.attributes_for(:category, en: 'New Value')
    end

    context 'as a guest' do
      it 'does not update the category' do
        patch :update, params: { id: @category.id, category: @category_params }
        expect(@category.reload.en).to_not eq 'New Value'
      end

      it 'returns a 302 response' do
        patch :update, params: { id: @category.id, category: @category_params }
        expect(response).to have_http_status '302'
      end

      it 'redirects to home page' do
        patch :update, params: { id: @category.id, category: @category_params }
        expect(response).to redirect_to '/'
      end
    end

    context 'as an user' do
      before do
        sign_in @user
      end

      it 'does not update the category' do
        patch :update, params: { id: @category.id, category: @category_params }
        expect(@category.reload.en).to_not eq 'New Value'
      end

      it 'returns a 302 response' do
        patch :update, params: { id: @category.id, category: @category_params }
        expect(response).to have_http_status '302'
      end

      it 'redirects to home page' do
        patch :update, params: { id: @category.id, category: @category_params }
        expect(response).to redirect_to '/'
      end
    end

    context 'as an admin' do
      before do
        sign_in @admin
      end

      it 'updates a category' do
        patch :update, params: { id: @category.id, category: @category_params }
        expect(@category.reload.en).to eq 'New Value'
      end
    end
  end

  describe '#destroy' do
    before do
      @user = FactoryBot.create(:user)
      @admin = FactoryBot.create(:admin)
      @category = FactoryBot.create(:category)
    end

    context 'as a guest' do
      it 'does not delete the category' do
        expect {
          delete :destroy, params: { id: @category.id }
        }.to_not change(Category, :count)
      end

      it 'returns a 302 response' do
        delete :destroy, params: { id: @category.id }
        expect(response).to have_http_status '302'
      end

      it 'redirects to home page' do
        delete :destroy, params: { id: @category.id }
        expect(response).to redirect_to '/'
      end
    end

    context 'as an user' do
      before do
        sign_in @user
      end

      it 'does not delete the category' do
        expect {
          delete :destroy, params: { id: @category.id }
        }.to_not change(Category, :count)
      end

      it 'returns a 302 response' do
        delete :destroy, params: { id: @category.id }
        expect(response).to have_http_status '302'
      end

      it 'redirects to home page' do
        delete :destroy, params: { id: @category.id }
        expect(response).to redirect_to '/'
      end
    end

    context 'as an admin' do
      before do
        sign_in @admin
      end

      it 'deletes a category' do
        expect {
          delete :destroy, params: { id: @category.id }
        }.to change(Category, :count).by(-1)
      end
    end
  end
end
