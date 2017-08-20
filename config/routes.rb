Rails.application.routes.draw do
  root 'tasks#index'
  devise_for :users, path: ''
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks, only: [:index]

  resources :regular_tasks, only: [:create]
  get "/:filename", to: "statics#show"
end
