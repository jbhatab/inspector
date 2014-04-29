Inspector::Application.routes.draw do
  resources :themes do
    member do
      get :inspector
      get :settings
    end
  end

  root 'themes#index'
end
