Rails.application.routes.draw do

  root "users#new"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get "/calender/:year/:month", to: "slots#month_index"
  get "/calender/:year/:month/:day", to: "slots#day_index"


  resources :slots do
    resources :feedbacks, shallow: true
  end


  get "slots/new/:year/:month/:day/:hour/:minute", to: "slots#new"



  post "/slots/:id/appointments", to: "appointments#create"
  delete "/appointments/:id", to: "appointments#delete"

end
