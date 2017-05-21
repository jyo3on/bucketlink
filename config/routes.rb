Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :stories, shallow: true
  end
  resources :buckets
  
  root 'home#index'
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
