Logbook::Application.routes.draw do
  resource  :site, :only => :index

  devise_for :users

  resources :applications do
    resources :entries, :only => :index
    resources :invites, :only => :create
  end

  resources :config_files, :only => :show
  resources :entries, :only => :create

  root :to => "sites#index"
end
