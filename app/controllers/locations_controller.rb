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
    erb :"/locations/new.html"
  end

  # POST: /locations/new
  post "/locations/new" do
    if params[:business_name] != "" and params[:address] != ""
      @location=Location.create(user_id: session[:user_id], business_name: params[:business_name], address: params[:address])
      if params[:comments] != "" or params[:friendly53]=="1"
        Comment.create(location_id: @location.id, user_id: session[:user_id], comment: params[:comments], friendly53: params[:friendly53])
      end
    else
    end
    # binding.pry
    @result = Location.all
    erb :"/locations/index.html"
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

  # GET: /locations/5
  get "/locations/:id" do
    @location = Location.find(params[:id])
    @comments = Comment.find_by(location_id: @location.id)
    # binding.pry
    erb :"/locations/show.html"
  end

  # GET: /locations/5/edit
  get "/locations/:id/edit" do
    erb :"/locations/edit.html"
  end

  # PATCH: /locations/5
  patch "/locations/:id" do
    redirect "/locations/:id"
  end

  # DELETE: /locations/5/delete
  delete "/locations/:id/delete" do
    redirect "/locations"
  end
end
