Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#index"
  resources :users, only: [:index, :new, :show, :create, :edit]
  resources :sessions, only: [:new, :create, :delete]
  get "/slots/:year/:month", to: "slots#month_index"
  get "/slots/:year/:month/:day", to: "slots#day_index"
  resources :slots, except: [:edit, :update, :index]
  
  resources :feedbacks
end
