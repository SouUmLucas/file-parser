Rails.application.routes.draw do
  root 'import_files#index'

  resources :import_files
end
