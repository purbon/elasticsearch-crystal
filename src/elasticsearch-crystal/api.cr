require "./api/*"

module Elasticsearch::API

  include Elasticsearch::API::Cat
  include Elasticsearch::API::Search
  include Elasticsearch::API::Indices
  include Elasticsearch::API::Count

end
