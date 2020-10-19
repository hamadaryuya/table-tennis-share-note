Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :calendars
  resources :trainings do
    resources :comments, only: :create
  end
  resources :games
  
  root to: "calendars#index"
end
