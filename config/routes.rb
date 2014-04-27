Inspector::Application.routes.draw do
  resources :themes do
    member do
      get :inspector
    end
  end

  root 'themes#index'
end
