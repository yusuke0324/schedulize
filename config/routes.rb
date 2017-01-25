Rails.application.routes.draw do












resources :users, only: [:index, :new, :show, :create, :edit]
resources :sessions, only: [:new, :create, :destroy]

root "users#index"
end
