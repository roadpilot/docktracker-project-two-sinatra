require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/welcome" do
    erb :welcome
  end

  get "/" do
    erb :index
  end

end
