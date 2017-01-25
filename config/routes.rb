Rails.application.routes.draw do
  get "/slots/:year/:month", to: "slots#month_index"
  get "/slots/:year/:month/:day", to: "slots#day_index"
  resources :slots, except: [:edit, :update, :index]
end
