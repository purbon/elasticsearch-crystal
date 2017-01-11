require "./elasticsearch-crystal/*"

module Elasticsearch
  class Client

    include Elasticsearch::API

    def initialize(address, port)
      @client = HTTPClient.new(address, port)
    end

  end
end
