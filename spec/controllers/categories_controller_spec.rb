describe Category, type: :controller do

  describe 'Get #index' do
    it 'populates an array of all categories' do
      animals = FactoryBot.create(:category, en: 'Animals')
      jobs = FactoryBot.create(:category, en: 'Jobs')
      get :index
      expect(assigns(:categories)).to match_array([animals, jobs])
    end

    it 'renders the :index view'
  end

end
