AfaWeb::Application.routes.draw do

  get "help/index"

#  devise_for :users
  devise_for :users, :path_names => {:sign_in => "login", :sign_out => "logout"}

#  resources "help" do
#    collection do
#      get 'plugins'
#      get 'tags'
#    end
#  end

  match 'help' => 'help#index'

  resources :users do
    get 'abilities', :on => :member
    post 'update_abilities', :on => :member
  end

  resources :posts do
    get 'admin', :on => :collection
  end

  resources :template_fields

  resources :field_categories

  match 'plugins/news' => 'plugins#news'

  resources :plugins do
    resources :techniques
  end

  resources :technique_templates

  resources :tags

  match 'plugins/:plugin_id/techniques/new' => 'techniques#new', :via => [:post]
  match 'plugins/add_tag/:id' => 'plugins#add_tag'
  match 'technique_templates/add_field_to_template/:id' => 'technique_templates#add_field_to_template'

  resources :technique_types

  resources :categories

  match 'index' => 'home#index'
  match 'about' => 'home#about'
  match 'administration' => 'home#administration'
  match 'downloads' => 'downloads#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

