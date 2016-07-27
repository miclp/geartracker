class GearItemsController < ApplicationController

  get '/gear' do
    validate_login
    @user = User.find(session[:user_id])
    erb :'/gear/gear'
  end

  get '/gear/new' do
    # create gear item
    # erb :'/gear/create'
  end

  post '/gear' do
    # create gear item
  end

  patch '/gear' do
    # update gear item
  end

  get '/gear/:id' do
    # erb :'/gear/show_item'
  end

  get 'gear/:id/edit' do
    # erb:'/gear/edit'
  end

  post 'gear/delete' do
    # 
  end


end
