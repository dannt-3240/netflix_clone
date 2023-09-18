class TvSeriesController < ActionController::Base
  layout 'sample'

  def index; end

  def show
    @tv_serie = TvSerie.find params[:id]
    @tv_episode = @tv_serie.tv_episodes.first
  end
end