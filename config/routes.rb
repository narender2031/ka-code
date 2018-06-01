Rails.application.routes.draw do
  post "google_session", to: "google_session#session"
  root "dashboard#index"
  post '/create_patient', to: "dashboard#create_patient"
  post '/create_doctor', to: "dashboard#create_doctor"
  post '/create_appointment', to: "dashboard#create_appointment"
  
  
  
  
  get '/login', to: "session#index"
  post '/auth', to: "session#create"
  get '/logout', to: "session#logout"
  post '/fb_login', to: "session#fb_login"


  
  resources :users
  get "dashboard/index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
