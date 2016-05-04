# Log Parser

This is a log parser for ruby on rails  projects. It uses a database in sqlLite and Rails 4.4 with Ruby 2.3
Log parser reads the log of a rails project an save its data in a model call Log. 

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

From command lines:

>Parser.new(path, allow_assets = false)

path : complete path of the log file
allow_assets : Flag that determines



The program provides two methods that you can be used from command line to retrive data from the log file:




You can see the results of the log parser in the root of the project accessing thought web. For example in local, after bundle exec rails s -b 0.0.0.0, you can see the list of logs recovery in http://localhost:3000 (notice that if you have more vagrant boxes up maybe the port can be different).

Also you can see the results you can access to the console and do queries directly to the model.F ields of the database are:

The UUID is unique and a primary key of the model/table. In each row is integrated all the revelant information about each UUID taked from the log file.



For seeing the results you can use 

bundle exec rails s -b 0.0.0.0
