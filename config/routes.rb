Rails.application.routes.draw do

root "timers#leaderboard"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
	get "/timers/leaderboard" => "timers#leaderboard", as: "leaderboard"




 resources :users

 get "/users/timers/:id" => "timers#user_photo", as: :profile_photo

 get "/users/:id/location"  => "timers#user_location", as: :user_location

  get "/users/:id/edit" => "users#edit"

 resources :sessions

 get "/timers/:id/location" => "timers#show_location", as: :show_location

 resources :timers

 get "/about" => "users#about" 

	get "/timers/:id" => "timers#photo", as: :photo

get "/login" => "sessions#new" , as: :login

get "/users/new" => "users#new" , as: :sign_up


post "/login" => "sessions#create"

 delete "/sign_out" => "sessions#destroy", as: "sign_out"


 
end
