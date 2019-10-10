Rails.application.routes.draw do
  resources :devices
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "static_pages#home"
  get '/api/docs', to: 'static_pages#api_docs', as: 'api_docs'
  post '/updates', to: 'updates#create', as: 'update'
end
