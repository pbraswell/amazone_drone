AmazoneDrone::Application.routes.draw do
  resources :products
  resources :orders

  root :to => 'visitors#new'
end
