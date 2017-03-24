class SongsController < ApplicationController
  def index
    if session[:user_id]
      @songs =Song.all
    else
      flash[:errors] = ["You are Not Logged In"]
      redirect_to '/users/new'
    end 
  end
end
