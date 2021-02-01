Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :create]


  get '/login' => 'sessions#login'
  post 'log' => 'sessions#log'
  post '/logout' => 'sessions#logout'
  match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]
end
