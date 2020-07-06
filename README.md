# FINSOC


# Follow instructions on downloading Ruby on Rails. 
# https://www.howtoforge.com/tutorial/how-to-install-ruby-on-rails-on-ubuntu-1804-lts/ is the website I used for Ubuntu 18.04, but you can search up instructions for yourself.
# Also do step 6, up until it asking for a login.

# Then, follow these instructions from Tony:

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

# End of Tony instructions. Most useful was create user.

pg_ctl start -l /usr/var/postgres/server.log
# Another method: pg_ctlcluster start -- pg_ctl -l /usr/var/postgres/server.log

# Port worked on 5432. If config/database.yml doesn't have username and password, it won't work (probably)

rails s
