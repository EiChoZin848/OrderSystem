ActionController::Routing::Routes.draw do |map|
  map.resources :users
  map.root :controller => 'orders', :action => 'index'
  map.connect '/signup', :controller => 'users', :action => 'new'
  #map.connect '/show', :controller => 'users', :action => 'show'
  map.connect '/edit', :controller => 'users', :action => 'edit'

  map.resources :sessions, :only => [:new, :create, :destroy]
  map.connect '/signin', :controller => 'sessions', :action => 'new'
  map.connect '/signout', :controller => 'sessions', :action => 'destroy'

  map.resources :orders
  map.connect '/new_order', :controller => 'orders', :action => 'new'
  map.connect '/edit_order', :controller => 'orders', :action => 'edit'
  map.connect '/show_order', :controller => 'orders', :action => 'show'
  map.connect '/index_order', :controller => 'orders', :action => 'index'

  map.resources :password_resets, :only => [:new, :create, :edit, :update]
  map.connect '/new_password_reset', :controller => 'password_resets', :action => 'new'
  map.connect '/edit_password_reset', :controller => 'password_resets', :action => 'edit'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
