Rails.application.routes.draw do

  get  '/signup',  to: 'utilisateurs#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  patch '/annonces/accepter/:id', to: 'annonces#accepter', as: 'annonces_accepter'
  patch '/annonces/annuler/:id', to: 'annonces#annuler', as: 'annonces_annuler'
  get '/mes/annonces', to: 'annonces#miennes', as: 'mes_annonces'
  get '/annonces/acceptées', to: 'annonces#travaux', as: 'mes_acceptes'
  get '/annonces/search', to: 'annonces#search', as: 'annonces_search'
  get '/home', to: 'sessions#home', as: 'home'

  resources :annonces
  resources :utilisateurs
  resources :secteur
  root 'sessions#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
