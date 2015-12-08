require "./spec_helper"

describe Elasticsearch::DSL do

  context "match query" do

    it "generate proper json" do
      expected =  "{\"match\":{\"message\":{\"query\":\"this is a test\",\"operator\":\"and\"}}}"
      query = SearchStub.new.search do |query|
        query.match do |match|
          match.field = "message"
          match.query = "this is a test"
          match.operator = "and"
        end
      end
      query.should eq(expected)
    end
  end
end
