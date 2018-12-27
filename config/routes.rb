Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    root :to => 'devise/registrations#new'
  end

  resources :programs, only: :new

  get 'profile', to: 'programs#index', as: 'profile'
  get 'edit', to: 'programs#edit'

  resources :homes, only: :index

  namespace :api do
    namespace :v1 do
      resources :assessments, only: [:index, :create, :update]
      resources :programs, only: [:index, :create, :update]
    end
  end
end
