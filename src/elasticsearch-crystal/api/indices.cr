module Elasticsearch::API::Indices

  def mapping(index)
    @client.get("#{index}/_mapping") do |body|
      JSON.parse(body) as Hash
    end
  end
end
