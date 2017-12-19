Rails.application.routes.draw do
  resources :waybills
  resources :user_addresses
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do 
    collection do 
      get :reset_password
      put :change_current_city
      get :user_card_logs
      get :coupons
    end
  end

  resources :categories, only: [:index, :show]


  get '/home/user', to: 'home#user', as: 'user_home'

  root to: 'categories#index'

  resources :addresses do 
    collection do 
      get :suggestion
    end
  end

  resources :orders do
  end

  resources :user_card_charge_settings, only: [:index] do 
    member do 
      post :pay
    end
  end

  resources :vouchers do 
    member do 
      get :pay
    end
  end
  
end