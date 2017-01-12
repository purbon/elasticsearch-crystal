module Elasticsearch::API::Count

  def count(index, query) : Hash
    query = { "query" => query }.to_json
    @client.get("#{index}/_count", query) do |body|
      JSON.parse(body).as_h.select "count"
    end
  end
end
