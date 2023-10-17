Rails.application.routes.draw do

  resources :categories, except: [:show]
  resources :containers do
    resources :records, except: [:index, :show]
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "containers#index"
end
