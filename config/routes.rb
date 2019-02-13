Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  
  resources :groups do
    resources :activities
  end
  resources :students
  resources :teachers
  resources :users
  resources :contacting
  
  resources :notfound, only: :index
  
  post 'add_teacher', to: 'groups#add_teacher', as: :add_teacher_to_group
  get 'delete_teacher/:group_id/:teacher_id', to: 'groups#delete_teacher', as: :delete_teacher_from_group
  mount Shrine.presign_endpoint(:cache) => '/presign'
end
