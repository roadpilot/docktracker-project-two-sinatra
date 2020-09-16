class UsersController < ApplicationController

  post "/" do
    @user = User.find_by(handle: params[:handle])
    # binding.pry
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        # flash[:message] = "Welcome, #{@user.username}"
        # # redirect "/tweets/#{@user.id}"
        # # binding.pry
        # redirect '/tweets'
        # logged_in?.to_s
    else
        # show an error message
        # flash[:message] = "Your credentials were invalid. Try again!"
        # # redirecting back to the login page
        # # this is where my error message with will display (at the login route)
    end
    redirect '/'
  end

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users/new
  post "/users/new" do
  # if params[:handle].empty? || params[:email].empty? || params[:password].empty?
  @user = User.new(params)
    if @user.save
      binding.pry
      session[:user_id] = @user.id
      redirect '/locations'
    else
      flash[:error] = "User signup failed: #{@user.errors.full_messages.to_sentence}"
      redirect '/users/new' 
    end
  end


  
  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

  get "/logoff" do
    session.clear
    redirect "/"
  end
end
