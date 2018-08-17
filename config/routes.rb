Rails.application.routes.draw do
  root 'categories#index'

  get '/change_language/:language', to: 'settings#change_language', as: :change_language

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
