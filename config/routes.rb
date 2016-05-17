Rails.application.routes.draw do

  devise_for :users
  resources :pics do
    member do
      put 'like', to: 'pics#like'
      put 'unlike', to: 'pics#unlike'
    end
  end

  root 'pics#index'

end
