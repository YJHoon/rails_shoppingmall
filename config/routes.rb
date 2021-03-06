Rails.application.routes.draw do
  root "items#index"
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  get '/mypage' => 'users#mypage'
  get '/mywish' => 'users#mywish'
  get '/mycart' => 'users#mycart'
  resources :posts
  resources :items do
    resources :reviews, only: %i[new create destroy]
    post "/wish", to: "wishes#wish_toggle"
    # post 방식으로 wish라는 주소를 추가 가하는데, 그 주소는 wishes_controller의 wish_toggle을 가리킨다.
  end
  resources :orders, except: [:destroy, :update, :edit] do
    post :tmp, on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
