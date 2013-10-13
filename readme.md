# Riak 1.4.2, leveldb storage engine, basho.com zombie data and secondary indexes

The following wikipage covers the step for a vagrant project which build upon the work in 
a sample vagrant riak1.3 build using the default bitcask engine (https://github.com/codingbynumbers/seven-databases/tree/master/3-riak) and 
also includes the basho.com sample zombie data (https://github.com/aggress/riak-zombie) 

I have also included several useful riak alias' for starting riak nodes and joining them in a cluster.

The basho sample project is configured for AWS not a devrel build, and so in a couple of places I have need to update the protocol buffers port

Another difference between this project and the "coding by numbers" riak build, is that 
* I have updated the riak version (from 1.3.1 to 1.4.2)
* I have switched the storage engine from bitcask to leveldb (which supports indexing).

For more details and documentation see:

http://wiki.ebabel.eu/index.php/Riak
http://haildata.net/category/riak/
