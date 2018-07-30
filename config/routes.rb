Rails.application.routes.draw do
  resources :tour_packages
  devise_for :users

  authenticated :user do
    root 'tour_packages#index', as: :authenticated_root
  end

  root "tour_packages#index", as: :home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
