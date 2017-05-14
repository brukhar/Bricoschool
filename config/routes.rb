Rails.application.routes.draw do
  get  '/signup',  to: 'utilisateurs#new'

  resources :annonces
  resources :utilisateurs
  root 'annonces#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
