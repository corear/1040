Rails.application.routes.draw do
  resources :lessons
  resources :questions
  resources :answers
  resources :responses
  devise_for :users
  root 'pages#index'

  get 'home' => "pages#home"
  get 'lesson/:id' => "pages#lessons"
  get '/secure/payment_info' => "pages#payment"
  get 'admin' => "pages#admin"
  get :send_order_mail, to: 'pages#send_order_mail', as: :send_order_mail
  get :send_two_week, to: 'pages#send_two_week', as: :send_two_week
  get :forget_two_week, to: 'pages#forget_two_week', as: :forget_two_week
  get :send_payment_change, to: 'pages#send_payment_change', as: :send_payment_change
  get :lift_banhammer, to: 'pages#lift_banhammer', as: :lift_banhammer
  get :enact_banhammer, to: 'pages#enact_banhammer', as: :enact_banhammer
  get :change_card, to: 'pages#change_card', as: :change_card
  get '/quiz/:id' => "pages#quiz"
  get '/answers' => 'answers#check'
  get '/viewPDF/:id' => 'pages#pdf'
  get '/user/:id' => "pages#user"
  get '/welcome' => 'pages#welcome'
  

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
