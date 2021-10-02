Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'
  # resources :prototypes do
  #   resources :comments, only: :create
  # end

  # resources :users
  # resources :prototypes, only: [:index, :new,:create]
  # resources :prototypes, only: [:index, :new,:create,:show,:edit,:update、:destroy]
  resources :prototypes do
    resources :comments, only: [:create,:show]
    # collection do
    #   get 'show'
    # end
  end
  resources :users, only: :show
end
