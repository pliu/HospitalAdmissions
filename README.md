# README

## Setup

Install MySQL

Install Ruby

At the end of the Ruby installation, it will ask if you want
to install a MSYS2 using ridk. The ridk MSYS2 installation
will have three options: 1, 2, and 3. Run each in order.

Install Bundler: gem install bundler

Install required gems: In the folder containing this project,
run: bundle install

Steps taken to resolve bcrypt LoadError:

    gem uninstall bcrypt (all versions)
    gem install bcrypt --platform=ruby
        
Steps taken to resolve mysql2 LoadError:

    gem uninstall mysql2 (all versions)
    Install MySQL Connector C
    gem install mysql2 --platform=ruby -- '--with-mysql-dir="<path to MySQL Connector C"'
        
In ./config/database.yml, change the database password to your
MySQL root password

Create database: In the folder containing this project, run:
rake db:create

Create tables: In the folder containing this project, run:
rake db:migrate

Seed tables: In the folder containing this project, run: rake
db:seed

Run the server: In the folder containing this project, run:
rails s

## Seeded users
nurse => password: password1, email: nurse@test.com

doctor => password: password1, email: doctor@test.com

medical => password: password1, email: medical@test.com

staff => password: password1, email: staff@test.com

admin => password: password1, email: admin@test.com
