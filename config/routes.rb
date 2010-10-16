Logbook::Application.routes.draw do
  get "site/index"

  devise_for :users
  resources :applications do
   resources :entries, :only => :index
  end

  resources :entries, :except => :index

  root :to => "site#index"
end
