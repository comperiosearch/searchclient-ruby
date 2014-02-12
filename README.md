#SEARCHCLIENT.RUBY
This is intended as an extremely simple starting point for creating middleware for Elasticsearch, a place to manage queries and results.
It uses the [Elasticsearch Ruby client](https://github.com/elasticsearch/elasticsearch-ruby) and [Grape](http://intridea.github.io/grape), "An opinionated micro-framework for creating REST-like APIs in Ruby"


The current implementation allows to send a query  into Elasticsearch, and dump the raw response.

The server runs on localhost:9292 as default.

Sample request:

```html
	http://localhost:9292/search?query=ipa
```
##Requirements
tested in ruby version 1.9.3 and version 2.0

## Installation

To install the necessary packages:

		sudo bundle install

on windows you may need to install ruby dev tools  
 


#RUNNING THE SERVER
type in the following command

   
    rackup



##CONFIGURATION
.env file contains settings for elasticsearch server and index

		ES_SERVER=http://localhost:9200
		ES_INDEX=
		
To search in your preferred index, set the ES_INDEX option
