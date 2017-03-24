Rails.application.routes.draw do
 root 'songs#index'

 post '/songs/create' => 'songs#create'
 get '/songs/:id' => 'songs#show'


 get '/users/new' => 'users#new'
 get '/users/:id' => 'users#show'
 post '/users/create' => 'users#create'
 post '/login' => 'users#login'
 post '/logout' => 'users#logout'

 post '/playlists/:song_id' => 'playlists#add'
end
