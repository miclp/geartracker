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

end
