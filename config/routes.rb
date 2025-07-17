Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "pages#index"
  get "/class_info", to: "pages#class_info"
  # get "/sample_materials", to: "pages#sample_materials", as: :sample_materials

  resources :contacts

  post "contact_us", to: "pages#submit_contact_us", as: :submit_contact_us

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
