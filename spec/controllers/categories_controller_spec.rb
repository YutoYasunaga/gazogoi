require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe "POST #create" do
    let(:category_attributes) { FactoryGirl.attributes_for(:category) }
    it 'saves new category' do
      post :create, params: { category: category_attributes }
      expect(Category.count).to eq(1)
    end
  end

end
