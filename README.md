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


------------------------------------------------------------------------------
# Cleaner Version of Instructions for Running FINSOC site locally
# We need to install RVM to manage our ruby versions
    The install instructions are on the site: https://rvm.io/
    
    However if you are running Ubuntu (my version was 20.04) you can just run the GPG key command and follow the ubuntu   install instructions here: https://github.com/rvm/ubuntu_rvm
    
    if you are on Windows using WSL 2 then you will need to either restart windows or terminate the virtual machine somehow
    
    Now at when thats finished you will have rvm installed with the latest version of ruby

# Make sure you have gcc, g++ and make installed
    sudo apt install gcc g++ make

# We need to install nodejs for javascript functionality
    you can find the install instructions on this site (I have used v10)
    https://github.com/nodesource/distributions/blob/master/README.md#deb

# We need to install PostgreSQL
    this site should give you instructions: https://www.postgresql.org/download/linux/ubuntu/
    on Ubuntu the command is: sudo apt install postgresql-12
        if that doesnt work then you can just use: sudo apt install postgresql
    
    We need to make sure that postgreSQL is running
        on Ubuntu run these commands to make sure that postgreSQL is run everytime on startup:
            systemctl start postgresql
            systemctl enable postgresql

        on WSL 2 one may need to run the following command everytime WSL restarts
            sudo service postgresql start

    In postgreSQL we need to add the dev user using
        sudo -u postgres psql -U postgres -c "CREATE USER dev_admin WITH CREATEDB PASSWORD 'yeetus'"

# enter the FINSOC site folder that you should have cloned using git
    you may need to install a different version of ruby, just follow the instructions it shows 
    
    use the following command to set up settings for the site
        sed -i "s/port: 5432/port: $(sudo -u postgres psql -U postgres -c "\conninfo" | egrep -o 'port .*' | egrep -o '[0-9]+')/g" config/database.yml

# you will need to install libpq-dev 
    sudo apt install libpq-dev 
    

# run bundle install while in FINSOC folder
    might need to update bundler or something like that just follow those instructions

# run this to do update rake database
    ./bin/setup rake

# Now everything is installed
    to run server: rails s
    it will tell you were to connect to it by default it is localhost:3000 
    

