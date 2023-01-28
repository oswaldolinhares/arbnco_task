Rails.application.routes.draw do
  resources :user_submissions, only: %i[index new create show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
