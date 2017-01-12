module Elasticsearch::API::Indices

  def mapping(index) : Hash
    @client.get("#{index}/_mapping") do |body|
      JSON.parse(body).as_h
    end
  end
end
