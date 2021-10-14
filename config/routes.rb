Rails.application.routes.draw do
  resources :trainers, except: [:edit, :new] do 
    resources :trainees, except: [:edit, :new]
    resources :workouts, except: [:edit, :new] do
      get :trainees, :on => :member
    end
  end
  # To enter the Vue JS SPA application
  root controller: 'trainers', action: 'main'
end
