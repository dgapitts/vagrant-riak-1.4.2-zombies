#! /bin/bash

if [ ! -f /home/vagrant/riak-1.4.2/dev/dev1/bin/riak ]
then
  echo "ADD EXTRA ALIAS VIA .bashrc"
  cat /vagrant/bashrc.append.txt >> /home/vagrant/.bashrc
  echo "Installing pre-requisites"
  apt-get -qq update
  apt-get -qq -y install libssl0.9.8 build-essential libc6-dev git curl vim tree unzip

  echo "updating ulimit"
  cp /vagrant/riak-ulimit.txt /etc/default/vagrant

  echo "Installing kerl"
  cp /vagrant/kerl .
  chown vagrant.vagrant kerl
  chmod a+x kerl
  cp -R /vagrant/.kerl /root

  echo "Building Erlang"
  ./kerl build R15B01 r15b01
  ./kerl install r15b01 /home/vagrant/erlang/r15b01
  . /home/vagrant/erlang/r15b01/activate
  echo . /home/vagrant/erlang/r15b01/activate >> /home/vagrant/.profile 

  echo "Building Riak"
  cp /vagrant/riak-1.4.2.tar.gz .
  tar zxf riak-1.4.2.tar.gz
  cd riak-1.4.2
  make rel
  make devrel
  cd ..
  chown -hR vagrant.vagrant riak-1.4.2
  echo "switching the storage backend from bitcask to levelDB (which supports indexes)"
  sed  -i 's/riak_kv_bitcask_backend/riak_kv_eleveldb_backend/g' /home/vagrant/riak-1.4.2/dev/dev1/etc/app.config
  sed  -i 's/riak_kv_bitcask_backend/riak_kv_eleveldb_backend/g' /home/vagrant/riak-1.4.2/dev/dev2/etc/app.config
  sed  -i 's/riak_kv_bitcask_backend/riak_kv_eleveldb_backend/g' /home/vagrant/riak-1.4.2/dev/dev3/etc/app.config
  sed  -i 's/riak_kv_bitcask_backend/riak_kv_eleveldb_backend/g' /home/vagrant/riak-1.4.2/dev/dev4/etc/app.config
  sed  -i 's/riak_kv_bitcask_backend/riak_kv_eleveldb_backend/g' /home/vagrant/riak-1.4.2/dev/dev5/etc/app.config

  echo "Installing Python Client for Riak"
  apt-get -qq -y install python-pip 
  pip install protobuf
  pip install riak
  mkdir /home/vagrant/load_zombies
  echo "including sample zombie data from riak (https://github.com/aggress/riak-zombie.git), tweaking the protocol buffers adjusting to 10017 for devrel"
  cp /vagrant/load_zombies/* /home/vagrant/load_zombies
  
  echo "Done!"
else
  echo "Riak appears to be setup already!"
fi
