class MoviesController < ActionController::Base
  layout 'sample'

  def index; end

  def show
    @movie = Movie.find params[:id]
  end
end
