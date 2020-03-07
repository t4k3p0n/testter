Rails.application.routes.draw do
  post "users/create" => "users#create"
  get 'users/show'
  get 'users/new' 
  get 'users/index'
  get "users/:id" => "users#show"
  get 'home/top'
  get 'home/login'
  get 'home/signup'
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
