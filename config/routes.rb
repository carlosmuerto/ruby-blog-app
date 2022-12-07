Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
			resources :comments, only: [:create]
			post "like"
		end
  end

  root "users#index"
end
