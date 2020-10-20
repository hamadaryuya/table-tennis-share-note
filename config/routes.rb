Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :calendars
  resources :trainings do
    resources :comments, only: :create
  end
  resources :games do
    resources :game_comments, only: :create
  end
  
  root to: "calendars#index"
end
