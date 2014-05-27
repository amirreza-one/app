VirtualGym::Application.routes.draw do


  resources :request_friendships

  resources :challenges

  resources :photo_events

  get "challenges/index"
  get "charts/index"
  #-- Profile
  get "/profiles/add_friend"
  get "/profiles/index_friend"

  #-- Messages
  get "/messages/inbox"
  get "/messages/sent"

  #-- Workouts
  get "/workouts/finish_workout"

  #-- USERS

    authenticated :user do
      resources :profiles
    end
    unauthenticated :user do
      root :to => redirect("users/sign_up")
    end


  resources :workout_plans do
    member do
      get :add_exercise
    end
  end

  resources :exercises do
    collection do
      get :add_exercise
    end
  end

  resources :workout_includings do
    member do
      post :set_fields
    end
  end

  devise_for :users


  resources :charts

  resources :profiles


  resources :messages

  resources :friendships

  resources :amount_types

  resources :equipment

  resources :foods

  resources :exercises

  resources :workouts

  resources :plans



  #match ':controller(/:action(/:id(.:format)))', :via => [:get,:post]
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
