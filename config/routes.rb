# These are all the available routes for the app
Rails.application.routes.draw do
	root :to => "home#index"
	devise_for :users
	resources :users
	resources :photos do
    collection do
      get :tags
    end
    resources:comments
  end
  resources :comments
  resources :albums do
    get :tags
    resources :comments
  end
end
