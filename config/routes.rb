Rails.application.routes.draw do
  root :to => "projects#index"
  resources :tasks
  resources :projects
  resources :persons
  resources :histories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
