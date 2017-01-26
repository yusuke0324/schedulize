Rails.application.routes.draw do
  root "users#index"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get "/calender/:year/:month", to: "slots#month_index"
  get "/calender/:year/:month/:day", to: "slots#day_index"
  resources :slots, except: [:edit, :update, :index]
  resources :feedbacks
end
