require "http/client"
require "json"

module Elasticsearch
  class HTTPClient

    def initialize(host, port)
      @client    = HTTP::Client.new(host, port)
    end

    def get(url, body=nil)
      request = request("get", url, nil, body)
      yield request.body
    end

    private def request(method, resource, headers=nil, body=nil)
      response = @client.exec(method, resource, headers, body)
      return response
    end
  end
end
