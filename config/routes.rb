Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'tweets#index'
  resources :users do
    member do
      post 'follow'
      delete 'unfollow'
    end
  end
  resources :tweets
end
