Rails.application.routes.draw do
  devise_for :users
  resources :posts
  # root 'pages#index'
  root 'pages#home'
  get '/home'=>'pages#home' #override default route
  get '/user/:id'=>'pages#profile'
  get '/explore'=>'pages#explore'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
