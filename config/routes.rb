Logbook::Application.routes.draw do
  get "site/index"

  devise_for :users
  resources :applications, :entries

  root :to => "site#index"
end
