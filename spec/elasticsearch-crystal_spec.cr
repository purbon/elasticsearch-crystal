require "./spec_helper"

describe Elasticsearch::Client do

  it "works" do
    client = Elasticsearch::Client.new("localhost", 9200)
    puts client.indices
  end
end
