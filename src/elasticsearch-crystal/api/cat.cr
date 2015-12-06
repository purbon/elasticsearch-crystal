module Elasticsearch::API::Cat

  NAMESPACE = "_cat"

  def indices
    @client.namespace = NAMESPACE
    @client.get("indices") do |body|
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
