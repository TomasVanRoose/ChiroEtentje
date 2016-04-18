Rails.application.routes.draw do
   root 'products#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

   resources :categories
   resources :products
   resources :users

   get 'orders/new', to: 'orders#new'
   post 'orders', to: 'orders#create'
   get 'orders', to: 'orders#index'

end
