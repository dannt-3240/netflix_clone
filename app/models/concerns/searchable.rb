#app/models/concerns/searchable.rb

require 'elasticsearch/model'

module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    after_commit on: %i[create update] do
      __elasticsearch__.index_document
    end

    after_commit on: %i[destroy] do
      __elasticsearch__.delete_document
    end

    # We serialize our model's attributes to JSON, including only the title and category fields.
  end
end
