require_relative 'config/environment'
require 'standalone_migrations'
StandaloneMigrations::Tasks.load_tasks

desc "Opens pry"
task :console do
  Pry.start
end

task :install do
  system("chmod +x bin/run")
  system("bundle install")
  system("rake db:migrate")
end
