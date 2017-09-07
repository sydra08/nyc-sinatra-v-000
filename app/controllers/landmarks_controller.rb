class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  post '/landmarks' do
    #create a new landmark and redirect to index
    redirect to '/landmarks'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    # update a landmark
    # create or update figure
    redirect to "/landmarks/show/#{@landmark.id}"
  end

end
