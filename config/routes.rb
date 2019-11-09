Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :posts
  resources :items do
    resources :reviews, only: %i[create destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
