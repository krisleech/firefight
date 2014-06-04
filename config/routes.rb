Rails.application.routes.draw do
  root 'diary#show'

  resource :diary, only: :show, controller: :diary do
    resources :assignments
  end

  resources :people
end
