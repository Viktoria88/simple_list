Rails.application.routes.draw do
  devise_for :users
  root 'users#sign_up'

end
