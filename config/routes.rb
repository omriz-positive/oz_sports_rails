Rails.application.routes.draw do
  resources :trainers
  get 'home/index';
  get 'home/json',  to: "home#json_res";
  get 'HelloWorld', to: "home#hello_world"; # This is case sensitive
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
