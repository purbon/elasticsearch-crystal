require "./example/*"
require "elasticsearch-crystal"

module Example

  def self.query_all
    client = Elasticsearch::Client.new "localhost", 9200
    query  = { "match_all" => {} of String => String }
    search = client.search("logstash-2014.09.02", query )
    puts search
  end
end

Example.query_all
