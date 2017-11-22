Rails.application.routes.draw do

root "timers#leaderboard"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
	get "/timers/leaderboard" => "timers#leaderboard", as: "leaderboard"

 resources :users
 resources :sessions
 resources :timers

 get "/about" => "users#about" 

	get "/timers/:id" => "timers#photo", as: :photo

get "/login" => "sessions#new" , as: :login

get "/users/new" => "users#new" , as: :sign_up


post "/login" => "sessions#create"

 delete "/sign_out" => "sessions#destroy", as: "sign_out"





 

 
end
