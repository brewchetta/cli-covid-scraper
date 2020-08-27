require_relative 'config/environment'
require 'standalone_migrations'
StandaloneMigrations::Tasks.load_tasks

desc "Opens pry"
task :console do
  Pry.start
end

desc "Installs and runs migrations for database"
task :install do
  system("chmod +x bin/run")
  system("bundle install")
  system("rake db:migrate")
end

desc "Adds a command to bash or z-shell to run covid-counter from anywhere in the terminal"
task :install_to_shell do
  dirname = File.expand_path File.dirname(__FILE__)
  root = dirname.split("/")[0,3].join("/")
  possible_shells = [".zshrc", ".bashrc"]
  shell = false
  possible_shells.each { |sh|
    shell = Pathname("#{root}/#{sh}").exist? && Pathname("#{root}/#{sh}") || shell
  }
  if shell && !File.readlines(shell).join("").include?("covid()")
    open(shell.to_s, 'a') do |f|
      f.puts <<~COMMAND
      covid() {
        cd #{dirname}
        bin/run "$@"
        cd - > /dev/null
      }
      COMMAND
    end
  elsif shell
    puts "The " + "covid".colorize(:red) + " command has already been installed"
  else
    puts "Could not find the proper file to install a shell command"
  end
end
