# These are all the available routes for the app
Rails.application.routes.draw do
	root :to => "home#index"
	devise_for :users
	resources :users
	resources :all_photos
  resources :photos do
    get :thumbs_up
    collection do
      get :tags
    end
    resources :comments
  end
  resources :comments
  resources :albums do
    collection do
      get :tags
    end
    resources :photos
    resources :comments
  end
end
