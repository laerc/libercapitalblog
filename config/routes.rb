Rails.application.routes.draw do
  resources :articles do
  	resources :comments
  end
  # list of indexes became the index page
  root to: 'articles#index'
end

