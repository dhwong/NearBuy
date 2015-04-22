

#NearBuy

A shopping webapp made with Ruby Rails and Angular.

~~Testing server~~: https://damp-castle-8451.herokuapp.com/widgets


#Dependencies

Ruby 2.0+, rails 4.1.5+, and Bower.

If you don't have Bower you first need to download npm.  The easiest way to get it is packaged with [node] (https://nodejs.org/download/).  When you've downloaded npm, type `npm install -g bower` into your terminal to download Bower.

After you have bower, run `bower install` in the project directory.

 **Note** the dependencies are installed on Vagrant cleanly if you have any issues.  Feel free to see if your operating system has a more lightweight npm download available [here] (https://github.com/npm/npm).

#To run

`rails server` in the project directory.  Follow the instructions to resolve any issues if it doesn't work right away.


#Sunspot Search through Solr

`$ bundle exec rake sunspot:solr:start`

** notify sunspot of changes to data **

`$ bundle exec rake sunspot:reindex`

