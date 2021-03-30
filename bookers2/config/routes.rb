Rails.application.routes.draw do
  devise_for :users

  root 'users#index'
  # ログイン後に適用されるのかどうなのか

  resources :homes, only: [:new, :cerate, :show]

  resources :books

  resources :users

  get 'home/about' => 'homes#index', as: 'about'
  # 'home#index' → 'homes#index'　複数形

end
