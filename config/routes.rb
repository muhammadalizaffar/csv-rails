Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  # post 'carts/:id' => "carts#create"

  resources :products do 
    collection { post :import }
  end
  resources :carts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
