class CommentsController < ApplicationController

  # GET: /comments
  get "/comments" do
    erb :"/comments/index.html"
  end

  # GET: /comments/new
  get "/comments/new" do
    erb :"/comments/new.html"
  end

  # POST: /comments
  post "/comments" do
    # binding.pry
    comment = Comment.new(params)
    if !comment.save
      flash[:error] = comment.errors.full_messages.to_sentence
    end
    redirect "/locations/#{params[:location_id]}"
  end

  # PATCH: /comments
  patch "/comments" do
  end

  # GET: /comments/5
  get "/comments/:id" do
    erb :"/comments/show.html"
  end

  # GET: /comments/5/edit
  get "/comments/:id/edit" do
    @comment = Comment.find(params[:id])
    @location = Location.find(@comment.location_id)
    erb :"/comments/edit.html"
  end

  # PATCH: /comments/5/edit
  patch "/comments/:id/edit" do
    # binding.pry
    comment = Comment.find(params[:id])
    # binding.pry
    comment.update(params.except(:_method))
    if !comment.save
      flash[:error] = comment.errors.full_messages.to_sentence
    end
    redirect "/locations/#{params[:location_id]}"
  end

  # DELETE: /comments/5/delete
  delete "/comments/:id/delete" do
    if session[:user_id] == @comment.user_id
      location_id = Comment.find(params[:id]).location_id
      Comment.find(params[:id]).destroy
    end
    redirect "/locations/#{location_id}"
  end
end
