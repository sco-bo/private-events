Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#delete'

  root 'static_pages#home'

  resources :users, only: [:new, :create, :show]
end
