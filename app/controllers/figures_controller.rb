class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  post '/figures' do
    binding.pry
    @figure = Figure.find_or_create_by(id: params[:id])
    if !params[:title][:name].empty?
      @figure.title_ids = Title.find_or_create_by(name: params[:title][:name])
    end
    if !params[:landmark][:name].empty?
      @figure.landmark_ids = Landmark.find_or_create_by(name: params[:landmark][:name])
    end

    redirect to '/figures'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    # update a landmark
    # create or update figure
    redirect to "/figures/show/#{@figure.id}"
  end

end
