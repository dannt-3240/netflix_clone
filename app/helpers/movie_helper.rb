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

  def get_video_url(file)
    upload_info = {
      title: generate_unique_filename(file.original_filename),
      parent_ids: [{ id: '1cuBlSwFTsUMfdSMUGMN-5GFbgCNXLoQ7' }],
      path: file.tempfile.path
    }

    upload_result = $drive.upload(upload_info)
  end

  def generate_unique_filename(original_filename)
    random_string = SecureRandom.hex(8)
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    "#{timestamp}_#{random_string}#{original_filename}"
  end

  def sub_tv_episodes_field form
    sub_tv_episodes = form.object.tv_episodes.build
    form.fields_for :tv_episodes, sub_tv_episodes,
      child_index: "hello" do |builder|
      render "tv_episode_fields", f: builder
    end
  end
end
