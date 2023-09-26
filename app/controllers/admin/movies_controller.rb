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
    @movie = Movie.new movie_params

    if @movie.save
      @movie.countries << Country.where(id: params[:movie][:country_ids])
      @movie.actors << Actor.where(id: params[:movie][:actor_ids])
      @movie.genres << Genre.where(id: params[:movie][:genre_ids])
      @movie.directors << Director.where(id: params[:movie][:director_ids])
      @movie.productions << Production.where(id: params[:movie][:production_ids])
      flash[:success] = "Create movie success"

      # move to job in future
      redirect_to new_admin_movie_path
      update_movie_video_url if movie_video_url_params
    else
      flash.now[:danger] = "Create movie errors"
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:duration, :imdb, :description, :country, :name, :release_year, :poster, :thumbnail,
      :country_ids, :actor_ids, :genre_ids, :director_ids, :production_ids,
      movie_video_attributes: [:video_url, :server_name, :server_order],
      ).tap do |attr|
        video_url = attr.dig(:movie_video_attributes, :video_url)
        attr[:movie_video_attributes][:video_url] = $drive.generate_unique_filename(video_url.original_filename) if video_url.present?
    end
  end

  def movie_video_url_params
    params.dig(:movie, :movie_video_attributes, :video_url)
  end

  def update_movie_video_url
    @movie.movie_video.update(video_url: $drive.get_video_url(movie_video_url_params))
  end
end
