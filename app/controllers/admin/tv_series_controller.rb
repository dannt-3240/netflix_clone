class Admin::TvSeriesController < Admin::AdminController
  include MovieHelper

  def new
    @movie = Movie.new
    @movie.tv_episodes.build
  end

  def create
    @movie = Movie.new build_params.merge(movie_type: "tv_series")
    if @movie.save
      update_video_url(@video_list)
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
      tv_episodes_attributes: [
        :name, :release_date, :tv_seasion_order,
        movie_video_attributes: [:video_url, :server_name, :server_order]
      ]
    )
  end

  def build_params
    @video_list = []
    movie_params.tap do |param|
      param[:tv_episodes_attributes] = param[:tv_episodes_attributes].values.map do |tv_episode|
        if tv_episode[:movie_video_attributes] && tv_episode[:movie_video_attributes][:video_url]
          original_file = tv_episode[:movie_video_attributes][:video_url]
          unique_filename = generate_unique_filename(original_file.original_filename)
          tv_episode[:movie_video_attributes][:video_url] = unique_filename
          @video_list << {video_file: original_file, movie_video_path: unique_filename}
        end
        tv_episode
      end
    end
  end

  def movie_video_url_params
    params[:movie][:tv_episodes_attributes][:movie_video_attributes][:video_url]
  end

  def update_video_url video_list
    video_list.each do |video|

    end
  end
end
