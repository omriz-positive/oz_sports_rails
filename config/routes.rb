Rails.application.routes.draw do
  get 'example/plain_text'
  get 'example/json_res'
  get 'example/xml_res'
  get 'example/view_res'
  get 'example/all_res'
  resources :trainers
  get 'home/index';
  get 'home/json',  to: "home#json_res";
  get 'HelloWorld', to: "home#hello_world"; # This is case sensitive
  get 'JustPickME', controller: 'home', action: 'oi_pick_me'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
