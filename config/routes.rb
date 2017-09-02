Rails.application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root "projects#index"

  resources :projects
  resources :tasks#, :collection => { :complete => :put }
  patch '/tasks/:id', to: 'tasks#complete', as: 'complete_task'

end
