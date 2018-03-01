Rails.application.routes.draw do
  devise_for :users
  resources :articles do
  	resources :comments
  end

  # list of indexes became the index page
  root to: 'articles#index'
end

