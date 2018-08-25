Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'categories#index'

  get '/change_language/:language', to: 'settings#change_language', as: :change_language
  get '/bookmark/:word_id', to: 'bookmarks#bookmark', as: :bookmark
  delete 'bookmark/:word_id', to: 'bookmarks#remove_bookmark', as: :remove_bookmark

  resources :categories do
    resources :words, except: :show
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
