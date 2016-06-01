Rails.application.routes.draw do
  with_options(defaults: { format: :json }, format: true) do
    resources :users, only: [:create, :show]
    resources :site_users, only: [:create, :show, :update] do
      resource :site_user_images, only: [:create]
      resource :site_user_header_image, only: [:create]
      resources :goods, only: [:index]
    end
    resources :site_user_images, only: [:update, :destroy]
    resources :site_user_header_images, only: [:show]
    resources :site_user_tags

    resources :creation_tags
    resources :creations, only: [:create, :show, :update] do
      resources :creation_images, only: [:create]
      resources :creation_pieces, only: [:create]
      resources :creation_comments, only: [:create]
      resources :goods, only: [:create]
    end
    resources :creation_images, only: [:show, :update, :destroy]
    resources :creation_pieces, only: [:update, :destroy]

    resources :creation_comments, only: [:show]
    resources :goods, only: [:destroy]
    resources :tags

    #resources :creation_statuses
    #resources :site_user_statuses
    #resources :tag_classes
    #resources :sites
    namespace :manage do
      get 'manage/index'
    end
  end

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
