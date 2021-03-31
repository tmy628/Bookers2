Rails.application.routes.draw do
  devise_for :users

  root 'homes#show'
  # homes/showに遷移

  resources :homes, only: [:new, :cerate, :show]

  resources :books

  resources :users

  get 'home/about' => 'homes#index', as: 'about'
  # 'home#index' → 'homes#index'　複数形

end
