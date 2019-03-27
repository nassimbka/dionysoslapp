Rails.application.routes.draw do
  # get 'events/index'
  # get 'events/show'
  root to: 'pages#home'
  devise_for :users

  namespace :events do
    resource :search, only: [:show, :create], controller: :search
  end

  resources :events, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


