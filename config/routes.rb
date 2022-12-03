Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
			resources :comment, only: [:new, :create]
			post "like"
		end
  end

  root "users#index"
end
