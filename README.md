# log Parser

This is a log parser for ruby on rails  projects. It uses a database in sqlLite and Rails 4.4 with Ruby 2.3
Log parser reads the log of a rails project an save its data in a model. 

##   Instalation

Log parser comes with its own vagrantfile, which provides an easy system to install the project. You only need to have instaled vagrant and virtualbox in your computer.

First clone the project in your local, then:

vagrant up

This will install the environment and the project dependencies.

To access to the project:

vagrant ssh
vagrant 
cd /vagrant
bundle install
bundle exec rails c

## Configuration

Of course you can install it by yourself as any other Rails project.

## Use

You can see the results of the log parser in the root of the project accesing thought web. For example in local, after bundle exec rails s -b 0.0.0.0)

To see the results you can access to the console and 

Fields of the database are:




For seeing the results you can use 

bundle exec rails s -b 0.0.0.0
