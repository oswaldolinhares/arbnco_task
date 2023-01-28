Rails.application.routes.draw do
  root to: 'user_submissions#new', as: :root

  resources :user_submissions, only: %i[index new create show]
end
