Rails.application.routes.draw do
  resources :games
  devise_for :users, :controllers => { :registrations => "registrations" }
  root to: "home#index"
end
