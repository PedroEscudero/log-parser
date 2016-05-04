require 'rake'

namespace :parser do

  task :run_parser, [:path] => :environment do |t, args|
    path = args[:path].nil? ? Rails.application.config.log_path : args[:path]
    p "Reading log in #{path}"
    parser = Parser.new(path)
    parser.tail
  end

end