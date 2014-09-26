Direwolf::Application.routes.draw do


  # resources :admins, only: [:index, :new, :create]
  # resources :employers, only: [:index, :new, :create]
  # resources :seekers, only: [:index, :new, :create, :edit]
  # resources :category, only: [:index, :destroy, :create]


  resources :admins
  resources :employers
  resources :seekers
  resources :users
  resources :jobs
  resources :job_applications
  resources :category

  # Handles accept/reject employer
  put "accept_employer/:id", to: "employers#accept"
  delete "reject_employer/:id", to: "employers#destroy"

  # Handles accept/reject admin
  put "accept_admin/:id", to: "admins#accept"
  delete "reject_admin/:id", to: "admins#destroy"

  post "job_applications/select/:id", to: "job_applications#select"
  post "job_applications/reject/:id", to: "job_applications#reject"

  # get all tags in json form
  get "jobtags", to: "jobs#get_tags_as_json"

  get "sessions/create"
  get "sessions/destroy"
 
  get "seekers/:id", to: "seekers#index"
  get "admins/:id", to: "admins#index" 
  get "employers/:id", to: "employers#index"

  get 'home/register', to: 'home#register'
  get 'home/:id/index', to: 'home#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :home, only: [:index]
  #resource :home, only: [:show]
  
  #root 'home#show'

  root 'welcome#index'
#root 'JobSeeker#dasboard'
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
