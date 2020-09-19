class LocationsController < ApplicationController

  # IF USER IS LOGGED IN, SHOW THE LOCATIONS SEARCH PAGE
  # GET: /locations
  get "/locations" do
    if logged_in?
      erb :"/locations/index.html"
    else
      redirect "/"
    end
  end

  # IF USER IS LOGGED IN, SHOW THE LOCATIONS CREATE PAGE
  # GET: /locations/new
  get "/locations/new" do
    if logged_in?
      erb :"/locations/new.html"
    else
      redirect "/"
    end
  end

  # PROCESS LOCATIONS CREATE FORM DATA
  # POST: /locations/new
  post "/locations/new" do
    # if params[:business_name] != "" and params[:address] != ""
    @location=Location.new(user_id: session[:user_id], business_name: params[:business_name], address: params[:address])
    if @location.save
      if params[:comment] != ""
        # binding.pry
        Comment.create(location_id: @location.id, user_id: session[:user_id], comment: params[:comment])
      end
      redirect "/locations/#{@location.id}"
    else
      flash[:error] = @location.errors.full_messages.to_sentence
       redirect "/locations/new"
    end
    # binding.pry
  end

  # PROCESS LOCATIONS SEARCH FORM DATA
  # POST: /locations
  post "/locations" do
    @search = params[:search]
    @result = []
    if @search != ""
      @result = Location.where("business_name LIKE (?) or address LIKE (?)", "#{params[:search]}%","#{params[:search]}%")
    end
    erb :"/locations/index.html"
  end

  # PATCH TO EDIT LOCATION INFORMATION
  patch "/locations/:id/edit" do
    if params[:business_name] != "" and params[:address] != ""
      @location = Location.find(params[:id])
      @location.business_name = params[:business_name]
      @location.address = params[:address]
      @location.save
      if params[:comments] != ""
        Comment.create(location_id: @location.id, user_id: session[:user_id], comment: params[:comments])
      end
    else
    end
    # binding.pry
    redirect "/locations/#{@location.id}"
  end

  # IF USER IS LOGGED IN, SHOW THE LOCATION INFORMATION AND COMMENTS PAGE
  # GET: /locations/5
  get "/locations/:id" do
    if logged_in?
      @location = Location.find(params[:id])
      @comments = @location.comments
      # binding.pry
      erb :"/locations/show.html"
    else
      redirect "/"
    end
  end

  # PATCH: /locations/5  RESERVED FOR FUTURE USE
  # patch "/locations/:id" do
  #   redirect "/locations/:id"
  # end

  # DELETE: /locations/5/delete  RESERVED FOR FUTURE USE
  # delete "/locations/:id/delete" do
  #   redirect "/locations"
  # end

  # GET: /locations/5/edit  RESERVED FOR FUTURE USE
  # get "/locations/:id/edit" do
  #   @location = Location.find(params[:id])
  #   erb :"/locations/edit.html" 
  # end

end
