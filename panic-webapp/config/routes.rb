PanicWebapp::Application.routes.draw do
  resources :leaks
  resources :credentials
  root :to => 'leaks#index'
end
