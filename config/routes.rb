Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  use_doorkeeper
  devise_for :users


  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
			resources :comments, only: [:create, :destroy]
			resources :likes, only: [:create]
		end
  end

	namespace :api do
		namespace :v1 do
			scope :users, module: :users do
				post '/', to: 'registrations#create', as: :user_registration
			end

			resources :users, only: [:index] do
				resources :posts, only: [:index] do
					resources :comments, only: [:index, :create]
				end
			end
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
