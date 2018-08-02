Rails.application.routes.draw do
  get 'tour_booking/:tour_package_id/tour_booker' => 'tour_booking#tour_booker', as: :tour_booker

  post 'tour_booking/:tour_package_id/tour_booker' => 'tour_booking#tour_booker_create', as: :tour_booker_create

  get 'tour_booking/:tour_package_id/tour_members' => 'tour_booking#tour_members', as: :tour_members

  post 'tour_booking/:tour_package_id/tour_members' => 'tour_booking#tour_member_create', as: :tour_member_create

  get 'tour_booking/:tour_package_id/tour_confirm' => 'tour_booking#tour_confirm', as: :tour_confirm

  post 'tour_booking/:tour_package_id/tour_confirm' => 'tour_booking#tour_confirm_done', as: :tour_confirm_done

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
