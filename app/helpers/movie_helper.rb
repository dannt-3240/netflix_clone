module MovieHelper
  def tv_seasion_order_options tv_serie
    tv_seasion_order = TvEpisode.where(tv_serie_id: tv_serie.id).pluck(:order)
    [
      ["Season 1", 1],
      ["Season 2", 2],
      ["Season 3", 3],
      ["Season 4", 4],
      ["Season 5", 5],
      ["Season 6", 6],
      ["Add new season", "Other"]
    ]
  end

  def sub_tv_episodes_field form
    sub_tv_episodes = form.object.tv_episodes.build
    form.fields_for :tv_episodes, sub_tv_episodes,
      child_index: "hello" do |builder|
      render "tv_episode_fields", f: builder
    end
  end
end
