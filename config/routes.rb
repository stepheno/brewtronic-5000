Brewtronic5000::Application.routes.draw do
  resources :hop_contracts


  resources :hop_transactions

  resources :grain_transactions

  resources :yeast_manufacturers

  resources :styles

  resources :recipe_minerals

  resources :recipes

  resources :mash_types

  resources :minerals

  resources :yeasts

  resources :batches
  resources :batch_steps

  resources :fermenters

  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end

  resources :hop_inventories

  get "home/index"

  resources :grain_inventories

  resources :grain_suppliers

  resources :grains

  resources :hop_suppliers

  resources :hops

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  match 'recipes/:id/duplicate' => 'recipes#duplicate', :as => :duplicate_recipe
  match 'batches/:id/duplicate' => 'batches#duplicate', :as => :duplicate_batch

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  authenticated :user do
      root :to => 'home#index'   
  end

  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
