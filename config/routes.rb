Rails.application.routes.draw do

  root "users#new"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get "/calender/:year/:month", to: "slots#month_index"
  get "/calender/:year/:month/:day", to: "slots#day_index"

  resources :slots

  resources :appointments
  resources :feedbacks
end
