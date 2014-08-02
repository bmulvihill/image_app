# These are all the available routes for the app
Rails.application.routes.draw do
	root :to => "home#index"
	devise_for :users
	resources :users
	resources :photos
  resources :comments
  resources :albums
end
