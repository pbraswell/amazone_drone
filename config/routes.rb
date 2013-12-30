AmazoneDrone::Application.routes.draw do
  resources :products

  root :to => 'visitors#new'
end
