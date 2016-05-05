# Log Parser

This is a log parser for ruby on rails  projects. It uses a database in SQLite and Rails 4.2.6 
 Log parser reads the log of a rails project and save its data in a model call Log, after formating it. 

##   Instalation

Log parser comes with its own vagrantfile, which provides an easy system to install the project. You only need to have installed vagrant and virtualbox in your computer.

First clone the project in your local, then:

`vagrant up`

This will install the environment and the project dependencies.

To access to the project:

 ```
vagrant ssh
vagrant 
cd /vagrant
bundle install
bundle exec rails c
 ```

Of course you can install it by yourself as any other rails project.

## Configuration

You can add to your application.rb file:

`config.log_path = 'path-to-default-log-to-read'`

This value will be used later as default value for rake task.

## How to use

Run:

`bundle exec rake parser:run_parser[path-to-logfile]`

if you don´t specify a path to the logfile the system will take the path from application.rb file (if there is any). This rake task takes the log, parses it, and saves the result in Log model. Also keep listening the log for new entries.

You can initalize a Parser object from command line:

`parser = Parser.new(path, allow_assets = false)`

path : complete path of the log file.

allow_assets : Flag that determines if the assets logs are treated or not (by default are not treated).

The program provides two methods that you can be used from command line to retrive data from the log file:

 ```
parser.read
parser.tail
 ```
read method reads the log and persits data in Log model.

tail method reads the log, persits data in Log model, and also keep listing the log file for adding new registres into the database.

You can see the results of the log parser in the root of the project accessing thought web. For example in local, after bundle exec rails s -b 0.0.0.0, you can see the list of logs recovered in http://localhost:3000 (notice that if you have more vagrant boxes up maybe the port can be different).

You can access to the console and do queries directly to the model. The UUID is the unique primary key of the model/table. In each row is integrated all the revelant information about each UUID taked from the log file. The structure of Log model is:
 ```
Log(uuid: string, message: string, ip: string, url: string, result: string, parameters: string, method: string, 
time: datetime, warning: string, error: string, created_at: datetime, updated_at: datetime)
 ```

## Testing

For running tests:

`rake test test/`
