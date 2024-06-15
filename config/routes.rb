Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get '/homes/about' => 'homes#about', as: 'about'
  resources :books, only: [:new, :index, :show]
  resources :users, only: [:show, :edit]
end

# resources :users, only: [:show, :edit, :update]
# get 'users/edit'
# get 'users/show'
# get 'books/new'
# get 'books/index'
# get 'books/show'
