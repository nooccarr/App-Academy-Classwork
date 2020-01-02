Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'users', to: 'users#index', as: 'users' user#index => User.all
  # post 'users', to: 'users#create'
  # get 'users/:id', to: 'users#show', as: 'user'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'
  resources :users, only: [:index, :create, :show, :update, :destroy] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end 
  
  resources :artworks, only: [:create, :show, :update, :destroy] do
    resources :comments, only: [:index]
  end

  resources :artwork_shares,
    only: [:create, :destroy]

  resources :comments,
    only: [:create, :destroy]
end
