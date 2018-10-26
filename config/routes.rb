Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    root :to => 'devise/registrations#new'
  end

  resources :programs, only: [:new, :index]

  get 'profile', to: 'programs#index', as: :profile

  resources :homes, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
