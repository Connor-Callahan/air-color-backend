Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :comments, only: [:index, :show, :create, :destroy]
      resources :shoes, only: [:index, :show, :create, :edit, :update, :destroy]
      resources :ratings, only: [:index, :show, :create, :edit, :update]
    end
  end
end
