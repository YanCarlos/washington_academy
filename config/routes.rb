Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  post 'send_meesage', to: 'home#save_message', as: :save_contactings
  
  resources :groups
  resources :students
  resources :teachers
  resources :users
  resources :workshops

  post 'add_teacher', to: 'groups#add_teacher', as: :add_teacher_to_group
  get 'delete_teacher/:group_id/:teacher_id', to: 'groups#delete_teacher', as: :delete_teacher_from_group
end
