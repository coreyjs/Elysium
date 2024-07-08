Rails.application.routes.draw do
  namespace :narrative do
    resources :steps
  end
  resources :default_property_fields

  resources :projects do
    resources :narrative_series, controller: 'narrative/series' do
      resources :narrative_roots, controller: 'narrative/roots' do
        resources :narrative_property_fields, controller: 'narrative/property_fields'
        resources :narrative_steps, controller: 'narrative/steps'
      end
    end
  end

  resources :narrative_property_fields, only: [:create, :update], controller: 'narrative/property_fields'


  get 'public/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: 'public#home'
end
