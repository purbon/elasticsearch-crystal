require "./spec_helper"

describe Elasticsearch::Client do

  it "works" do
    client  = Elasticsearch::Client.new("localhost", 9200)
    indices = client.indices
    (indices.size > 0).should be_true
  end

  it "works" do
    client = Elasticsearch::Client.new("localhost", 9200)
    query  = { "match_all" => {} of String => String }
    search = client.search("logstash-2014.09.02", query )
    (search.size > 0).should be_true
  end
end
