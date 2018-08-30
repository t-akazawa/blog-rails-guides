Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resource と resourcesの違いに注意, rails routesで確認
  resources :articles

  root 'welcome#index'
end
