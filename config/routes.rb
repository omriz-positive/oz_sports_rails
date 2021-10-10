Rails.application.routes.draw do
  resources :trainers do 
    get 'main', :on => :collection # Alt inline Version
    resources :trainees, except: [:edit, :new] do
      get :workouts
    end
    resources :workouts, except: [:edit, :new] do
      get :trainees
    end
  end
  root controller: 'trainers', action: 'main'
  
  # The routes below are for my own practice
  get 'example/plain_text'
  get 'example/json_res'
  get 'example/xml_res'
  get 'example/view_res'
  get 'example/all_res'
  get 'home/index';
  get 'home/json',  to: "home#json_res";
  get 'HelloWorld', to: "home#hello_world"; # This is case sensitive
  get 'JustPickME', controller: 'home', action: 'oi_pick_me'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
