class Admin::TvSeriesController < Admin::AdminController
  include MovieHelper

  def new
    @tv_serie = TvSerie.new

    # binding.pry

    @tv_serie.tv_episodes.build
  end

  def create
    # binding.pry
    @tv_serie = TvSerie.new build_params
    if @tv_serie.save
      @tv_serie.countries << Country.where(id: params[:tv_serie][:country_ids])
      @tv_serie.actors << Actor.where(id: params[:tv_serie][:actor_ids])
      @tv_serie.genres << Genre.where(id: params[:tv_serie][:genre_ids])
      @tv_serie.directors << Director.where(id: params[:tv_serie][:director_ids])
      @tv_serie.productions << Production.where(id: params[:tv_serie][:production_ids])

      flash[:success] = "Create tv series success"
      redirect_to new_admin_tv_series_path
      update_video_url(@video_list)
    else
      flash.now[:danger] = "Create tv series errors"
      render :new
    end
  end

  private

  def tv_serie_params
    params.require(:tv_serie).permit(:duration, :imdb, :description, :country, :name, :release_year, :poster, :thumbnail,
      tv_episodes_attributes: [
        :name, :release_date, :tv_season_order,
        movie_video_attributes: [:video_url, :server_name, :server_order]
      ]
    )
  end

  def build_params
    @video_list = []
    tv_serie_params.tap do |param|
      param[:tv_episodes_attributes] = param[:tv_episodes_attributes].values.map do |tv_episode|
        if tv_episode[:movie_video_attributes] && tv_episode[:movie_video_attributes][:video_url]
          original_file = tv_episode[:movie_video_attributes][:video_url]
          unique_filename = $drive.generate_unique_filename(original_file.original_filename)
          tv_episode[:movie_video_attributes][:video_url] = unique_filename
          @video_list << {video_file: original_file, movie_video_path: unique_filename}
        end
        tv_episode
      end
    end
  end

  def tv_serie_video_url_params
    params[:tv_serie][:tv_episodes_attributes][:tv_serie_video_attributes][:video_url]
  end

  def update_video_url video_list
    video_list.each do |video|
      movie_video = MovieVideo.find_by video_url: video[:movie_video_path]
      next unless movie_video

      movie_video.update!(video_url: $drive.get_video_url(video[:video_file]))
    end
  end
end
