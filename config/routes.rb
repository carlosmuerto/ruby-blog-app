def resources_routes
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
			resources :comments, only: [:create, :destroy]
			resources :likes, only: [:create]
		end
  end
end


Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

	resources_routes

	namespace :api do
		namespace :v1 do
			scope :users, module: :users do
				post '/', to: 'registrations#create', as: :user_registration
			end
			resources_routes
		end
  end

	scope :api do
		scope :v1 do
			use_doorkeeper do
				skip_controllers :authorizations, :applications, :authorized_applications
			end
		end
	end


  root "users#index"
end
