Rails.application.routes.draw do
  resources :leases, only: [:create, :destroy]
  resources :apartments, except: [:new, :edit]
  resources :tenants, except: [:new, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
