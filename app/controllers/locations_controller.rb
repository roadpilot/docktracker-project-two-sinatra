class LocationsController < ApplicationController

  # GET: /locations
  get "/locations" do
    if logged_in?
      erb :"/locations/index.html"
    else
      erb :index
    end
  end

  # GET: /locations/new
  get "/locations/new" do
    if logged_in?
      erb :"/locations/new.html"
    else
      erb :index
    end
  end

  # POST: /locations/new
  post "/locations/new" do
    # if params[:business_name] != "" and params[:address] != ""
    @location=Location.new(user_id: session[:user_id], business_name: params[:business_name], address: params[:address])
    if @location.save
      if params[:comments] != ""
        Comment.create(location_id: @location.id, user_id: session[:user_id], comment: params[:comments])
      end
      @result = Location.all
      erb :"/locations/index.html"
    else
      flash[:error] = @location.errors.full_messages.to_sentence
       redirect "/locations/new"
    end
    # binding.pry
  end

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

  # GET: /locations/5
  get "/locations/:id" do
    if logged_in?
      @location = Location.find(params[:id])
      @comments = @location.comments
      # binding.pry
      erb :"/locations/show.html"
    else
      erb :index
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
