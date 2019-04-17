Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout'}, :skip => [:registrations] , :controllers => { registrations: "registrations"}
  resources :portfolios
  resources :blogs, only: [:index, :show, :toggle]
  get 'pages/home'
  root to: 'pages#home'
end
