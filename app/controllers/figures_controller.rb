class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  #new
  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do

    @figure = Figure.create(name: params[:name])
    redirect to '/figures/#{@figure.id}'
  end

  #show
  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  #edit
  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id]) #should I find it by name?
   @figure = Figure.update(name: params[:name])
    redirect to '/figures/#{@figure.id}'

  end


end
