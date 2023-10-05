Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show] do
        resources :posts, only: %i[index show new create destroy] do
          resources :comments, only: %i[new create destroy]
            resource :like, only: :create
       end
      end
    end
  end
end
