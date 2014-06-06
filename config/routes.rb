ThaaliyolaRor::Application.routes.draw do
    resources :issuings

    resources :languages

    resources :languagedivisions

    resources :users

    resources :shelves

    resources :categories

    resources :shelfpositions

    resources :categorizations

    resources :authorships

    resources :authors

    resources :books

    get "list/index"
    get "books/index"
    get "report" => "books#report"
    post "sign_in" => "users#sign_in"
    get "sign_in" => "users#login"
    get "success" => "users#success"
    get "sign_up" => "users#new"
    post "logout" => "users#sign_out"
    post "users/:id/reset_password" => "users#reset_password"
    get "users/:id/reset_password" => "users#password_reset", as:"password_reset"
    get "edit_user_photo" => "users#changephoto"
    patch "users/:id/issue" => "users#issue", as:"issue"

    patch "users/:id/return" => "users#return", as:"return"
    patch "users/:id/reset_password" => "users#reset_password"
    root :to => "books#index"

    #      root :to => "list#index", :as => "list"
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
