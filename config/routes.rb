Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:index, :new, :show, :create, :edit]
  resources :sessions, only: [:new, :create, :delete]
  get "/slots/:year/:month", to: "slots#month_index"
  get "/slots/:year/:month/:day", to: "slots#day_index"
  resources :slots, except: [:edit, :update, :index]
end
