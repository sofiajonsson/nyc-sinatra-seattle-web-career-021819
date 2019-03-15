class FiguresController < ApplicationController
  # add controller methods
  set :views, 'app/views/figures'

  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  get '/figures/new' do
    @titles=Title.all
    @landmarks=Landmark.all
    erb :new
  end

  post '/figures' do
    # binding.pry
    new_figure = Figure.create(params[:figure])
    # binding.pry
      # puts "The current Figure.all.count is " + Figure.all.count.to_s
    FigureTitle.create(title_id: params[:figure][:title_ids][0] , figure_id: new_figure.id)

# binding.pry
    redirect to '/figures'
    # "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :show
  end

#update
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :edit
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    # binding.pry
    figure.update(params[:figures])
    redirect "/figures/#{figure.id}"
  end

end
