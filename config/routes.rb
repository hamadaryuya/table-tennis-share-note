Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :calendars
  root to: "calendars#index"
end
