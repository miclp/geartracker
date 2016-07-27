class UsersController < ApplicationController

  get '/signup' do
    redirect "/gear_items" if logged_in?
    erb :'/users/create_user'
  end

  post '/signup' do
    # create the user if it doesn't already exist
    if params[:username] != "" && params[:password] != "" && params[:email] != ""
      @user = User.new(username: params[:username], password: params[:password])
      @user.save
      session[:user_id] = @user.id

      redirect "/gear_items"
    else
      redirect "/signup"
    end
  end

  get '/login' do
    redirect "/gear_items" if logged_in?
    erb :'/users/login'
  end

  post '/login' do
    # check if credentials are good, set session?
    if params[:username] != "" && params[:password] != ""
      # go to the account page
      @user = User.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect "/gear_items"
      end
    else
      redirect "/"
    end
    redirect "/login"
  end

  get '/logout' do
    session.clear
    redirect "/login"
  end

end
