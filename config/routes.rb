Rails.application.routes.draw do
  resources :users, shallow: true do
    resources :matches, shallow: true do
      resources :contact do
        resources :comments, only: [:create]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
