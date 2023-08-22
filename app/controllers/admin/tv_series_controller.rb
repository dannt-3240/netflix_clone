class Admin::TvSeriesController < Admin::AdminController
  include MovieHelper

  def new
    @movie = Movie.new
    @movie.tv_episodes.build
  end

  def create
    @movie = Movie.new movie_params.merge(movie_type: "tv_series")

    if @movie.save


      flash[:success] = "Create tv series success"

      redirect_to new_admin_tv_series_path
    else
      flash.now[:danger] = "Create tv series errors"
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:duration, :imdb, :description, :country, :name, :release_year, :poster, :thumbnail,
      tv_episodes_attributes: [:name, :release_date])
  end
end
