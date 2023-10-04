class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @movies = []
    else
      @movies = Elasticsearch::Model.search(
        { query: { query_string: { query: params[:q], fields: ['name'] } }, size: 10 },
        [Movie, TvSerie]
      )
    end
  end
end
