Rails.application.routes.draw do

  get  '/signup',  to: 'utilisateurs#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  patch '/annonces/accepter/:id', to: 'annonces#accepter'
  patch '/annonces/annuler/:id', to: 'annonces#annuler', as: 'annonces_annuler'
  get '/mes/annonces', to: 'annonces#miennes', as: 'mes_annonces'
  get '/annonces/acceptées', to: 'annonces#travaux', as: 'mes_acceptes'

  resources :annonces
  resources :utilisateurs
  root 'annonces#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
