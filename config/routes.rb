require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root to: 'user_submissions#new', as: :root

  resources :user_submissions, only: %i[index new create show]
end
