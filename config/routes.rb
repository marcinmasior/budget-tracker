Rails.application.routes.draw do

  resources :categories, except: [:show]
  resources :containers do
    resources :records, except: [:index, :show] do
      member do
        get :clone
        put :toggle_paid
      end
    end
  end
  devise_for :users

  root "containers#index"
end
