Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :calendars
  resources :trainings
  root to: "calendars#index"
end
