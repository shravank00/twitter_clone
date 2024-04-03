Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'tweets#index'
  resources :users do
    member do
      post 'follow'
      post 'unfollow'
    end
  end
  resources :tweets do
    member do
      post 'like'
      post 'dislike'
    end
  end

end
