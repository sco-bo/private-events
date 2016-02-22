Rails.application.routes.draw do
  root 'static_pages#home'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#delete'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
end
