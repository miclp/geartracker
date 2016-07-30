class GearItemsController < ApplicationController

  get '/gear' do
    validate_login
    @user = User.find(session[:user_id])
    erb :'/gear/gear'
  end

  get '/gear/new' do
    validate_login
    # create gear item
    erb :'/gear/create'
  end

  post '/gear' do
    # create the gear_item and persist to db
    validate_login
    @user = User.find(session[:user_id])

    if params[:name] != ""
      @gear = GearItem.create(name: params[:name], description: params[:description], gear_type: params[:gear_type], value: params[:value], year: params[:year], image_url: params[:image_url], notes: params[:notes])
      @gear.user_id = @user.id
      @gear.save
    elsif params[:name] == ""
      redirect "/gear/new"
    end
    erb :'/gear/show_item'

  end

  patch '/gear' do
    validate_login
    # update gear item
    @gear = GearItem.find(params[:gear_id])

    @gear.name = params[:name] unless params[:name] == ""
    @gear.description = params[:description]
    @gear.gear_type = params[:gear_type]
    @gear.value = params[:value]
    @gear.year = params[:year]
    @gear.image_url = params[:image_url]
    @gear.notes = params[:notes]
    @gear.save
    redirect '/gear'
  end

  get '/gear/:id' do
    validate_login
    @gear = GearItem.find(params[:id])
    erb :'/gear/show_item'
  end

  get '/gear/:id/edit' do
    validate_login
    @gear = GearItem.find(params[:id])
    erb :'/gear/edit'
  end

  post '/gear/delete' do
    validate_login
    @gear = GearItem.find(params[:gear_id])
    if @gear.user_id == session[:user_id]
      @gear.delete
    end
    redirect '/gear'
  end


end
