Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  post 'send_meesage', to: 'home#save_message', as: :save_contactings
  
  resources :groups
  resources :students
  resources :users
end
