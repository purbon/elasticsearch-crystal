require "http/client"
require "json"

module Elasticsearch
  class HTTPClient

    getter :namespace
    setter :namespace

    def initialize(host, port)
      @client    = HTTP::Client.new(host, port)
      @namespace = ""
    end

    def get(command)
      request = request("get", "#{namespace}/#{command}", nil, nil)
      yield request.body
    end

    private def request(method, resource, headers=nil, body=nil)
      response = @client.exec(method, resource, headers, body)
      return response
    end
  end
end
