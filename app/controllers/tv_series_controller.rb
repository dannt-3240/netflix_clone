class TvSeriesController < ActionController::Base
  layout 'sample'

  def index; end

  def show
    @tv_serie = TvSerie.find(params[:id])

    # Find the tv_season_order based on the parameter or the first tv_episode's order
    tv_season_order = params[:tv_season_order] || @tv_serie.tv_episodes.order(:tv_season_order).first&.tv_season_order

    # Find episodes for the specified tv_season_order or fallback to the first tv_season_order
    @tv_episodes = @tv_serie.tv_episodes.where(tv_season_order: tv_season_order)

    # Find the tv_episode by tv_episode_id or fallback to the first episode
    # binding.pry
    @tv_episode = @tv_episodes.find_by(id: params[:tv_episode_id]) || @tv_episodes.first
  end
end
