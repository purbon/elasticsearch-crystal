module Elasticsearch::API::Search

  NAMESPACE="_search"

  def search(index, query)
    query = { "query" => query }.to_json
    @client.get("#{index}/_search", query) do |body|
      JSON.parse(body) as Hash
    end
  end
end
