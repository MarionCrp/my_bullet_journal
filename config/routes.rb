Rails.application.routes.draw do
  devise_for :users, path: ''
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :user, path: '' do
    resources :tasks, only: [:index]
    resources :regular_tasks, only: [:create]
    root 'tasks#index'
  end
  get "/:filename", to: "statics#show"
  root 'user/sessions#new'
end
