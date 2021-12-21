require 'sparql/client'
sparql = SPARQL::Client.new("http://dbpedia.org/sparql")

class Actor

  def self.find(name:)

    @actors ||= Hash.new do |cache, key|
      cache[key] = films(actor: name)
    end
    @actors[name]
  end

  def self.films(actor)
    client = SPARQL::Client.new("http://dbpedia.org/sparql")

    results = {}
    binding.pry
    client.query(query).first.each_binding do |name, value|
      results[name] = value
    end
    results
  end

  private

  def self.query
    <<~SPARQL
      SELECT ?f
      WHERE {
        ?f rdf:type dbo:Film .
        ?f dbo:starring dbr:Macaulay_Culkin .
      }
    SPARQL
  end
end
