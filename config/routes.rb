Rails.application.routes.draw do
	root 'home#top'
	get 'home/about', to: 'home#about'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show]
  # For details on the DSL  within this file, see http://guides.rubyonrails.org/routing.html
end