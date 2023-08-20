module MovieHelper
  def movie_type_options
    [
      ["Single Movie", "single_movie"],
      ["TV Series", "tv_series"]
    ]
  end

  def movie_country_options
    [
      ["Choose country", nil],
      ["USA", "us"],
      ["France", "fr"],
      ["United Kingdom", "uk"],
      ["China", "cn"],
      ["Japan", "jp"],
      ["Other", "other"]
    ]
  end
end
