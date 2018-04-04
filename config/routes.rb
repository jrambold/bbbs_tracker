Rails.application.routes.draw do
  resources :users, shallow: true do
    resources :matches, shallow: true do
      resources :contact do
        resources :comments, only: [:create]
      end
    end
  end
  root "welcome#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
