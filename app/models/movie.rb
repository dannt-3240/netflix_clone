class Movie < ApplicationRecord
    has_many :list_items
    has_many :reviews
    has_many :ratings
    has_many :castings
    has_many :user_movie_watchlists
    has_many :genres

    def poster_image_link
        $drive.get(self.poster).web_content_link
    end

    def video_link
        $drive.get(self.video_url).web_content_link
    end
end
