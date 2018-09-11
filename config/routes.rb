Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  post 'send_meesage', to: 'home#save_message', as: :save_contactings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
