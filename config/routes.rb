Bella::Application.routes.draw do

  # Don't need these auto-generated routes.
  # We are using default route.
  get "admin_users/index"
  get "admin_users/new"
  get "admin_users/edit"
  get "admin_users/delete"
  get "public/show"
  get "products/index"
  get "products/show"

  get 'show/:permalink', :to => 'lines#show'

  root "public#index"
  resources :lines do
    resources :products
  end
	resources :categories do

    end
  get 'admin', :to => "admin/access#index"
  namespace :admin do

    get 'show/:permalink', :to => 'public#show'
    get 'line/:permalink', :to => 'lines#show'
    post 'line/:permalink', :to => 'lines#show'
    get 'logout', :to => "access#logout"
    get 'login', :to => "access#login"
    get 'attempt_login', :to => "access#attempt_login"
    post 'attempt_login', :to => "access#attempt_login"
    
    resources :categories do
      member do
        get :delete
      end
    end
    resources :lines do
      member do
        get :delete
      end
      resources :products do
        member do
          get :delete
        end
      end   
    end
    resources :admin_users
  end
  #get "demo/index"
  #match ':controller(/:action(/:id))', :via => [:get, :post]

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
