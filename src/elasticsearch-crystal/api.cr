require "./api/cat"
require "./api/search"

module Elasticsearch::API

  include Elasticsearch::API::Cat
  include Elasticsearch::API::Search

end
