Rails.application.routes.draw do
  devise_for :users, path: ''
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :user, path: '' do
    resources :tasks, only: [:index]
    resources :regular_tasks, only: [:index] do
      get 'toggle_done', on: :collection
    end
    resources :regular_task_categories, only: [:index, :new, :edit, :create, :update , :destroy] do
      member do
        put :toggle_enabled
      end
    end
    root 'tasks#index'
  end
  get "/:filename", to: "statics#show"
  root 'user/sessions#new'
end
