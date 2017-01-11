module Elasticsearch::API::Search

  def search(index, query) : Hash
    query = { "query" => query }.to_json
    @client.get("#{index}/_search", query) do |body|
      JSON.parse(body).as_h
    end
  end
end
