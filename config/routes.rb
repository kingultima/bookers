Rails.application.routes.draw do
devise_for :users
resources :users, only:[ :index, :show, :update, :edit] #device_forの後に
resources :books
root to: 'users#top', as: 'root'
get '/user/about' => 'users#about', as: 'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
