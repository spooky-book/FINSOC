#!/bin/bash

# Build essential (gcc.etc.)
sudo apt-get -y install build-essential

# Install RVM
# https://rvm.io/rvm/install
sudo apt-get -y install curl ca-certificates gnupg
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable

export PATH=$PATH:$HOME/.rvm/bin
rvm install 2.3.1
bash --login -c 'rvm use 2.3.1;'
export PATH=$PATH:$HOME/.rvm/rubies/ruby-2.3.1/bin/

# Install postgresql
# https://wiki.postgresql.org/wiki/Apt
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo apt-get update
sudo apt-get -y install postgresql-9.6 libpq-dev
export PATH=/usr/lib/postgresql/9.6/bin/:$PATH

sudo -u postgres psql -U postgres -c "CREATE USER dev_admin WITH CREATEDB PASSWORD 'yeetus'"

# Install javascript runtime
sudo apt-get -y install nodejs

sed -i "s/port: 5432/port: $(sudo -u postgres psql -U postgres -c "\conninfo" | egrep -o 'port .*' | egrep -o '[0-9]+')/g" config/database.yml

./bin/setup
rake

echo ""
echo "Ensure your application is configured to connect to postgresql on $(sudo -u postgres psql -U postgres -c "\conninfo" | egrep -o 'port .*')"
echo "Start the server again by executing 'rails s'"
echo ""

rails s
