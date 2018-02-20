Rails.application.routes.draw do
  resources :articles
  # list of indexes became the index page
  root to: 'articles#index'
end
