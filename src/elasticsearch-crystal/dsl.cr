require "json"

module Elasticsearch::DSL

  def search
    query = Query.new
    yield query
    query.to_json
  end

  class Query
    setter :match
    getter :match

    def match
      match = Match.new
      yield match
      @match = match
      self
    end

    def to_json(io)
      io.json_object do |object|
        object.field "match",  match
      end
    end
  end

  class Match
    setter :field, :query, :operator, :zero_terms_query, :cutoff_frequency, :type
    getter :field, :query, :operator, :zero_terms_query, :cutoff_frequency, :type

    def to_json(io)
      io.json_object do |object|
        object.field "#{field}" do
          io.json_object do |field_object|
            field_object.field "query",  query
            field_object.field "operator",  operator                 if operator
            field_object.field "type",  type                         if type
            field_object.field "zero_terms_query",  zero_terms_query if zero_terms_query
            field_object.field "cutoff_frequency",  cutoff_frequency if cutoff_frequency
          end
        end
      end
    end
  end
end
