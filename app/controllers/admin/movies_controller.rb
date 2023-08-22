class Admin::MoviesController < Admin::AdminController
  include MovieHelper

  def new
    @movie = Movie.new
  end

  def index
    @movie = Movie.last
  end

  def show
    @movie = Movie.find params[:id]
  end

  def create
    @movie = Movie.new movie_params.merge(movie_type: "single_movie")

    if @movie.save
      flash[:success] = "Create movie success"
      # redirect_to admin_movie_path(@movie.id)

      # move to job in future
      @movie.movie_video.update video_url: get_video_url(movie_video_url_params)
      redirect_to new_admin_movie_path

    else
      flash.now[:danger] = "Create movie errors"
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:duration, :imdb, :description, :country, :name, :release_year, :poster, :thumbnail,
      movie_video_attributes: [:video_url, :server_name, :server_order]).tap do |attr|
      attr[:movie_video_attributes][:video_url] = generate_unique_filename(attr[:movie_video_attributes][:video_url].original_filename) if attr[:movie_video_attributes][:video_url]
    end
  end

  def movie_video_url_params
    params[:movie][:movie_video_attributes][:video_url]
  end
end
