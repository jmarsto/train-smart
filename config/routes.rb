Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    root :to => 'devise/registrations#new'
  end

  resources :programs, only: [:new, :index]

  get 'profile', to: 'programs#index', as: :profile

  resources :homes, only: :index

  namespace :api do
    namespace :v1 do
      resources :assessments, only: :create
      resources :programs, only: [:index, :create]
    end
  end
end
