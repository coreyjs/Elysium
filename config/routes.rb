Rails.application.routes.draw do

  resources :projects do
    resources :narrative_series, controller: 'narrative/series' do
      resources :roots, controller: 'narrative/roots' do
        resources :property_fields, controller: 'narrative/property_fields'
      end
    end
  end


  get 'public/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: 'public#home'
end
