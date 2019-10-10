Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "static_pages#home"
  get '/api/docs', to: 'static_pages#api_docs', as: 'api_docs'
  post '/updates', to: 'updates#create', as: 'update'

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }
  end

  authenticate :user do
    resources :devices
  end


end
