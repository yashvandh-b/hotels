Rails.application.routes.draw do
  devise_for :users
  resources :hotels
  #get 'home/index'
  get 'home/about'
  #root 'home#index'
  root 'hotels#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
