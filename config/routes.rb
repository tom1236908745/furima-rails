Rails.application.routes.draw do

  
  post 'comments/:item_id/create' => "comments#create"

  delete 'likes/:item_id/destroy' => "likes#destroy"
  post 'likes/:item_id/create' => "likes#create"

  get 'users/:id/likes' => "users#likes"
  delete 'users/:id/destroy' => "users#destroy"
  get 'users/:id/edit' => "users#edit"
  post 'users/:id/update' => "users#update"
  post 'users/create' => "users#create"
  get 'signup' => "users#new"
  
  post 'logout' => "users#logout"
  get 'login' => "users#login_form"
  post 'login' => "users#login"
  get 'users/index' => "users#index"
  get 'users/:id' => "users#show"

  get '/' => "items#index"
  get 'items/new' => "items#new"
  get 'items/category/:category' => "items#category"
  post 'items/create' => "items#create"
  get 'items/:id' => "items#show"
  get 'items/:id/edit' => "items#edit"
  post 'items/:id/update' => "items#update"
  delete 'items/:id/destroy' => "items#destroy"
  get 'guide' => "home#guide"
  
end
