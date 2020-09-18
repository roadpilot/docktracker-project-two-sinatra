class CommentsController < ApplicationController

  # POST: /comments
  post "/comments" do
    # binding.pry
    comment = Comment.new(params)
    if !comment.save
      flash[:error] = comment.errors.full_messages.to_sentence
    end
    redirect "/locations/#{params[:location_id]}"
  end

  # GET: /comments/5/edit
  get "/comments/:id/edit" do
    if logged_in?
      @comment = Comment.find(params[:id])
      @location = Location.find(@comment.location_id)
      erb :"/comments/edit.html"
    else
      redirect :'/'
    end
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
