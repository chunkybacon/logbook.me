Logbook::Application.routes.draw do
  resource  :site, :only => :index

  devise_for :users

  resources :applications do
    resources :entries, :only => :index
  end

  resources :config_files, :only => :show
  resources :entries, :except => :index

  root :to => "sites#index"
end
