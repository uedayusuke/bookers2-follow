Rails.application.routes.draw do
  devise_for :users
  root to: 'users#top'
  get  "home/about" => "users#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :books do
  	resource :favorites
  	resource :book_comments
  end
end
