Rails.application.routes.draw do












resources :users, only: [:index, :new, :show, :create, :edit]
resources :sessions, only: [:new, :create, :delete]

root "users#index"
end
