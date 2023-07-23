Rails.application.routes.draw do

  get '/reports', to: 'reports#index'
  get 'reports/report_by_category'
  get 'reports/report_by_dates'

  root 'main#index'

  resources :operations
  resources :categories

end
