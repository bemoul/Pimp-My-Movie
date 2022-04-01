Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'movies#home'
  resource 'profiles', only: [:show, :edit], :path => "my-account"

  resources 'movies' do
    resources :comments
    resources :ratings
  end

  resources 'actors' do
    resources :movies
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
