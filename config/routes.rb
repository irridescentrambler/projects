Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "roots#main"

  resources(:pages, only: []) do
    collection do
      get :admin_dashboard
      get :developer_dashboard
      get :home_page
    end
  end

  resources(:roots, only: []) do 
    collection do
      get :main
    end
  end

  resources :projects
  resources :tasks
end
