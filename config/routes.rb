Rails.application.routes.draw do
  get 'annonces/index'

  get 'annonces/show'

  get 'annonces/new'

  resources :annonces

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
