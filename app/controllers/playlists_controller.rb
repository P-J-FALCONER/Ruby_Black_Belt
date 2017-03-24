class PlaylistsController < ApplicationController
  def add
    playlist = Playlist.create(user_id: session[:user_id], song_id: params[:song_id])
    if playlist.errors.full_messages[0]
      flash[:errors] = ['Error adding Song']
      redirect_to '/'
    else
      redirect_to '/'
    end
  end
end
