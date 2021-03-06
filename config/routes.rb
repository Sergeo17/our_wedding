OurWedding::Application.routes.draw do
  resources :households do
    collection do
      get :search
    end
  end
  resources :guests do
    get 'summary', on: :collection
  end




  root 'households#search'
  #match '/guests/search', to: 'guest#search', via: 'get'
  match '/admin', to: 'static_pages#home', via: 'get'
  get "guests/new"
  #get "households/new"
  get "static_pages/home"
  match '/guests', to: 'guest#index', via: 'get'
  match '/households/search', to: 'household#search', via: 'get'
  match '/households', to: 'household#index', via: 'get'
  #match '/guests/search', to: 'guest#search', via: 'get', on: :collection

  get '/households/:id/edit', to: 'households#edit', as: 'rsvp'
  get '/households/select', to: 'households#select'

  get '/households', to: 'households#index'
  get '/guests/summary', to: 'guests#summary'

  get '/guests/:id/edit', to: 'guests#edit'
  get '/comments', to: 'comments#index'

  #match '/rsvp', to: 'households#edit', via: 'get'
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
