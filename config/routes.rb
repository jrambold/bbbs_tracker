Rails.application.routes.draw do
  resources :users
  resources :contacts
  resources :notes
  resources :matches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
