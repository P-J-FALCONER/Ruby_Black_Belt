class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(first_name: params[:first_name],last_name: params[:last_name], email:params[:email], password: params[:password])
    if user.errors.full_messages[0]
      flash[:errors] = user.errors.full_messages
      redirect_to '/users/new'
    else
      session[:user_id] = user.id 
      session[:name] = user.first_name
      redirect_to '/'
    end
  end

  def login
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        session[:name] = user.first_name 
        redirect_to '/'
      else
        flash[:errors] = ["Incorrect Password"]
        redirect_to '/users/new'
      end
    else
      flash[:errors] = ["Incorrect Email or Not In System"]
      redirect_to '/users/new'
    end
  end
  
  def logout
    reset_session
    redirect_to '/users/new'
  end
end
