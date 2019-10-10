Rails.application.routes.draw do
  resources :devices
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "static_pages#home"
end
