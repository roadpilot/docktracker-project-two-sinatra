class UsersController < ApplicationController

  # LOG IN THE USER
  post "/" do
    @user = User.find_by(handle: params[:handle])
    # binding.pry
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
    else
        # show an error message
        flash[:error] = "Either your handle or your password was wrong. Try again!"
    end
    redirect '/'
  end

  # CREATE NEW USER FORM
  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # CREATE NEW USER AND SEND THEM TO SEARCH FORM
  # POST: /users/new
  post "/users/new" do
  # if params[:handle].empty? || params[:email].empty? || params[:password].empty?
  @user = User.new(params)
    if @user.save
      # binding.pry
      session[:user_id] = @user.id
      redirect '/locations'
    else
      flash[:error] = "User signup failed: #{@user.errors.full_messages.to_sentence}"
      redirect '/users/new' 
    end
  end

  # LOG OFF THE USER
  get "/logoff" do
    session.clear
    redirect "/"
  end

  # POST: /users  RESERVED FOR FUTURE USE
  # post "/users" do
  #   redirect "/users"
  # end

  # GET: /users/5  RESERVED FOR FUTURE USE
  # get "/users/:id" do
  #   erb :"/users/show.html"
  # end

  # GET: /users/5/edit  RESERVED FOR FUTURE USE
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end

  # PATCH: /users/5  RESERVED FOR FUTURE USE
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end

  # DELETE: /users/5/delete  RESERVED FOR FUTURE USE
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end

  # GET: /users  RESERVED FOR FUTURE USE
  # get "/users" do
  #   erb :"/users/index.html"
  # end

end
