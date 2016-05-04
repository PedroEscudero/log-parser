# Log Parser

This is a log parser for ruby on rails  projects. It uses a database in SQLite and Rails 4.2.6 
Log parser reads the log of a rails project an save its data in a model call Logcafter formating it. 

##   Instalation

Log parser comes with its own vagrantfile, which provides an easy system to install the project. You only need to have instaled vagrant and virtualbox in your computer.

First clone the project in your local, then:

>vagrant up

This will install the environment and the project dependencies.

To access to the project:

>vagrant ssh
>vagrant 
>cd /vagrant
>bundle install
>bundle exec rails c

Of course you can install it by yourself as any other Rails project.

## Configuration



## Use

You can initalize a Parser object from command line:

>
>parser = Parser.new(path, allow_assets = false)
>

The program provides two methods that you can be used from command line to retrive data from the log file:

path : complete path of the log file
allow_assets : Flag that determines is the assets logs are treated or not (by default are not treated).







>p

You can see the results of the log parser in the root of the project accessing thought web. For example in local, after bundle exec rails s -b 0.0.0.0, you can see the list of logs recovery in http://localhost:3000 (notice that if you have more vagrant boxes up maybe the port can be different).

Also you can see the results you can access to the console and do queries directly to the model. The UUID is unique and the primary key of the model/table. In each row is integrated all the revelant information about each UUID taked from the log file.

# Testing

For running test run

>rake
