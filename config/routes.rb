Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  #root 'listings#index'
  root :to => 'sessions#show'

  get '/listings/show', to: 'listings#show'
  get '/listings/delete/:id', to: 'listings#delete'
  get '/listings/new'
  post '/listings/create'
  get '/listings/index'
  get '/listings/update'
  patch '/listings/update'
  post '/listings/update'

  get 'users/edit'
  patch 'users/edit', to: 'users#update'

  get 'users/login'

  get '/pictures/delete/:id', to: 'pictures#destroy'

  resources :users do
    member do
      get :confirm_email
    end
  end

  get 'listings/delete'

  get '/users/show', to: 'users#show'
  get 'users/index', to: 'users#index'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  post 'sessions/create'
  get 'sessions/destroy'

  resources :password_resets, only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
