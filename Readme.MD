#FRONT.RUBY
This is intended as an extremely simple middleware for elasticsearch
It uses the elasticsearch ruby client and Grape, "An opinionated micro-framework for creating REST-like APIs in Ruby. 
http://intridea.github.io/grape "

The current implementation allows to send a query  into elasticsearch, and dump the raw response from elasticsearch.
The server runs on localhost:9292 as default,  
Sample request:

	http://localhost:9292/query=ipa

##Requirements
ruby version 1.9.3

ruby dev tools (for grape, on windows)

And you should do some gem install

    gem install elasticsearch
    gem install grape
    gem install rack
    gem install elasticsearch



#RUNNING THE SERVER
type in the following command

    
    rackup
##CONFIGURATION
.env file contains settings for elasticsearch server and index

 ##TODO
 use bundler to specify list of gems
