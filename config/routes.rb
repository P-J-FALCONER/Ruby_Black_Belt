Rails.application.routes.draw do
 root 'songs#index'




 get '/users/new' => 'users#new'
 post '/users/create' => 'users#create'
 post '/login' => 'users#login'
 post '/logout' => 'users#logout'

end
