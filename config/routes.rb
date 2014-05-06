Inspector::Application.routes.draw do

  resources :users

  resource :dropbox do
    get  :main
    post :upload
    get  :auth_start
    get  :auth_finish
  end

  resources :themes do
    member do
      get :inspector
      get :settings
      get :customize
    end
  end

  root 'themes#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
