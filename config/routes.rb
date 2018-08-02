Rails.application.routes.draw do
  get 'tour_booking/tour_booker'

  get 'tour_booking/tour_confirm'

  resources :tour_packages do
  	collection do
  		get "search"
  		get "filter"
  	end
  end
  resources :destinations
  devise_for :users

  authenticated :user do
    root 'tour_packages#index', as: :authenticated_root
  end

  root "tour_packages#index", as: :home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
