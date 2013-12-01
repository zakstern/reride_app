RerideApp::Application.routes.draw do
  resources :quotes
  resources :contacts
  resources :bikes
    match 'bikes/update_model_select/:id', :controller=>'bikes', :action => 'update_model_select', via: 'get'
    match 'bikes/update_year_select/:id', :controller=>'bikes', :action => 'update_year_select', via: 'get'
    match 'bikes/search/', :controller=> 'bikes', :action => 'search', via: 'post'

  resources :quotes
    match 'quotes/search/', :controller=> 'quotes', :action => 'search', via: 'post'
  resources :customers

  resources :transactions do
    get 'decline_offer', on: :member
  end

  resources :inspections
    
  resources :resellers do
    resources :users
  end

  resources :bike_shops do
    resources :users
  end

  root  'static_pages#home'
  match '/bike_shop_signup', to: 'bike_shops#new', via: 'get'
  match '/reseller_signup', to: 'resellers#new', via: 'get'
  match '/signup',  to: 'customers#new',        via: 'get'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/inspectioncomplete',   to: 'static_pages#inspectioncomplete',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
