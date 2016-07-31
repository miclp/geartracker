require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    use Rack::Flash

    enable :sessions unless test?
    set :session_secret, "imnottelling"
  end

  get '/' do
    erb :'/index'
  end

  # Helper Methods
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def validate_login
      redirect "/login" if !logged_in?
    end
  end

end
