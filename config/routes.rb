Rails.application.routes.draw do
  get 'reports/report_by_category'
  get 'reports/report_by_dates'
  root 'main#index'

  resources :main
  resources :reports
  resources :operations
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
