Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  # get 'authorized', to: 'sessions#page_requires_login'
  #get 'review_book', to: "books#createreview"
  get '/book/:id/review', to: 'books#review', as: 'review_book'
  post '/book/:id/review', to: 'books#savereview', as: 'save_review_book'
  resources :books
  resources :users
  get 'welcome/index'
  root 'welcome#index'
end
