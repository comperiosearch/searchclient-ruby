require 'elasticsearch'
require 'hashie'

#client = Elasticsearch::Client.new host: '80.91.34.90:9200', log: true
client = Elasticsearch::Client.new  log: true
client.transport.reload_connections!

client.cluster.health

response = client.search index: 'beerdata',
                         body: {
                           query: { match_all: {} },
                           facets: { beerstyle: { terms: { field: 'beerstyle' } } }
                         }

mash = Hashie::Mash.new response
print "\r\n"
print mash.hits.hits.first._source.title
print mash.facets.beerstyle.total
print "\r\n"
for term in  mash.facets.beerstyle.terms
 	print "#{term.term}  #{term.count} \r\n"
 	

end

