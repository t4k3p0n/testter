Rails.application.routes.draw do
  get 'users/login_form'
  get 'users/top'
  post "login" => "users#login"
  post "guest" , to: "users#guest"
  post "logout" => "users#logout"
  post "users/create" => "users#create"
  post "users/tasks" => "users#tasks"
  post "users/:id/destroy" => "users#destroy"
  post "users/:id/update" => "users#update"
  post "users/:id/change" => "users#change"
  post "users/:id/photoch" => "users#photoch"
  post "groups/:id/create" => "groups#create"
  get 'users/show'
  get 'users/new' 
  get 'users/member'
  get 'users/index' => "users#index"
  get "users/:id" => "users#show"
  get 'groups/project'
  get "groups/:id/view" => "groups#view"
  get 'home/top'
  get 'home/login'
  get 'home/signup'
  root 'users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
