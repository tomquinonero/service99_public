Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'add_users', to: 'users#bulk_new'
  get 'total_users', to: 'users#index'
  post 'add_users', to: 'users#add_users'

  root 'users#bulk_new'
end
