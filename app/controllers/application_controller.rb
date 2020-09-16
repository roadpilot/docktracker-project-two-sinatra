require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "P.=]8pTbS+76Hpw*"
    register Sinatra::Flash
  end

  #this is the initial corneal welcome page - just wanted to keep it for reference
  get "/welcome" do
    erb :welcome
  end

  get "/" do
    if logged_in?
      redirect '/locations'
    else
      erb :index
    end
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

  end

end
