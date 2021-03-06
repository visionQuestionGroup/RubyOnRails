Rails.application.routes.draw do
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

  # API ROUTES

  # USER SIGN UP AND LOGIN ROUTES

  post '/users/register', to: 'users#register'
  post '/users/login', to: 'users#login'
  get '/users', to: 'users#get_users'
  get '/user', to: 'users#get_user'
  delete '/user', to: 'users#delete_user'

  # POST IMAGE ROUTES

  post '/posts/new', to: 'posts#new'
  get '/post/:id', to: 'posts#show'
  get '/posts/user', to: 'posts#user_posts'
  get '/posts/user/notsolved', to: 'posts#user_posts_not_solved'
  get '/posts/user/solved', to: 'posts#user_posts_solved'
  get '/posts/all', to: 'posts#all'
  get '/posts/all/playable', to: 'posts#all_playable'
  get '/posts/all/unplayable', to: 'posts#all_unplayable'

  # GUESSES ROUTES

  post '/guesses', to: 'guesses#new'

  # SCOREBOARD ROUTES

  get '/topscores', to: 'scoreboard#top_scores'
  get '/user/score', to: 'scoreboard#total_user_score'

  # HOME PAGE

  root to: 'welcome#index'
end
