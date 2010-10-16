Logbook::Application.routes.draw do
  resource  :site, :only => :index do
    member do
      get 'dashboard'
    end
  end

  devise_for :users
  resources :applications do
   resources :entries, :only => :index
  end

  resources :entries, :except => :index

  match "dashboard" => "sites#dashboard"
  
  root :to => "sites#index"
end
