Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get '/homes/about' => 'homes#about', as: 'about'
  resources :books, only: [:new, :create, :index, :show, :destroy, :update, :edit]
  resources :users, only: [:show, :edit, :index, :update]
end

# resources :users, only: [:show, :edit, :update]
# get 'users/edit'
# get 'users/show'
# get 'books/new'
# get 'books/index'
# get 'books/show'
