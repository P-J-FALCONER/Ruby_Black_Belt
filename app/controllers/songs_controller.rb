class SongsController < ApplicationController
  def index
    if session[:user_id]
      @songs = Song.all.order('created_at DESC')
      @counts = {}
      @songs.each do |song|
        scount = Playlist.where(song_id:song.id).count
        @counts[song.id] = scount
      end
      puts " COUNTS #{@counts}"
    else
      flash[:errors] = ["You are Not Logged In"]
      redirect_to '/users/new'
    end 
  end

  def create
    song = Song.create(title: params[:title], artist: params[:artist])
    if song.errors.full_messages[0]
      flash[:errors] = song.errors.full_messages
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def show
    @song = Song.find(params[:id])
    @users = Playlist.where(song_id:@song.id).where.not(user_id:session[:user_id]).select(:user_id).distinct
    puts @users.inspect
    @counts ={}
    @users.each do |user|
      scount = Playlist.where(user_id:user.user_id, song_id:params[:id]).count
      @counts[user.user_id] = scount
    end
    puts "USER COUNTS ON SONGS #{@counts}"
  end
end
