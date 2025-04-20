Rails.application.routes.draw do
  resources :users, only: [:update] do
    collection do
      get "current"
    end
  end
  post "messages", to: "messages#create"
  get "messages", to: "messages#index"
  post "contacts/import"
  get "contacts", to: "contacts#index"
  post "sessions/create"
  post "sessions/authenticate"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
