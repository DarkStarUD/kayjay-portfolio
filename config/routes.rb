Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout'}, :skip => [:registrations] , :controllers => { registrations: "registrations"}
  resources :portfolios
  resources :contacts,  only: [:new, :create]
  resources :topics,  only: [:index]
  resources :blogs, only: [:index, :show, :search] do
    member do
      get :toggle_status
    end
    collection do
  		get 'search'
  	end
  end

  
  mount ActionCable.server => '/cable'
  get 'tags/:tag', to: 'blogs#index', as: :tag
  get 'pages/home'
  root to: 'pages#home'
end
