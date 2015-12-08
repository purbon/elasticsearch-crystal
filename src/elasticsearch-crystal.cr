require "./elasticsearch-crystal/*"
require "./elasticsearch-crystal/dsl/*"

module Elasticsearch
  class Client

    include Elasticsearch::API

    def initialize(address, port)
      @client = HTTPClient.new(address, port)
    end

  end
end
