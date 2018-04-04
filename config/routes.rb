Rails.application.routes.draw do
  resources :users, except: [:destroy], shallow: true do
    resources :matches
  end

  resources :matches, only: [:show] do
    resources :contact, only: [:index, :show, :edit, :update] do
      resources :comments, only: [:create]
    end
  end

  root "welcome#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users, only: [:index, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
