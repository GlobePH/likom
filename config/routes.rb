Rails.application.routes.draw do
  devise_for :lgu_officers
  root 'pages#index'
  get '/prepare' => 'pages#prepare', as: :prepare
  get '/donate' => 'pages#donate', as: :donate
  get '/view' => 'pages#view', as: :view
  get '/about' => 'pages#about', as: :about
  get '/contact' => 'pages#contact', as: :contact
  get '/area' => 'pages#area', as: :area
  get '/help_centers' => 'pages#centers', as: :centers
  get '/responses' => 'pages#responses', as: :responses
  get '/registrations/autocomplete_area_name' => '/registrations/autocomplete_area_name', as: :autocomplete_area_name_registrations
  get '/resident_responses/:id' => 'pages#resident_responses', as: :resident_responses
  resources :lgu_responses

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
