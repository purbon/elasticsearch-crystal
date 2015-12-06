module Elasticsearch::API::Cat


  def indices
    @client.get("_cat/indices") do |body|
      data = {} of String => Array(String)
      body.each_line do |line|
        fields = line.split(" ")
        index  = fields[2]
        fields.delete(index)
        data[index] = fields
      end
      data
    end
  end
end
