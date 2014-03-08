# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano/rails/assets'

namespace :deploy do 
  desc "Symlink database.yml so precompile works"
  task :symlink_db_yml do
    on roles(:app) do 
      execute "ln -s #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
    end
  end

  desc "Symlink database to shared file"
  task :symlink_db_file do
    on roles(:app) do 
      execute "ln -s #{deploy_to}/shared/config/development.sqlite3 #{current_path}/config/development.sqlite3"
    end
  end
  
  desc "Restart Passenger app"
  task :restart do
    on roles(:app) do
      execute "touch #{File.join(current_path, 'tmp', 'restart.txt')}"
    end
  end
end

before "deploy:assets:precompile", "deploy:symlink_db_yml"
after "deploy", "deploy:symlink_db_file"
after "deploy", "deploy:restart"
after "deploy", "deploy:cleanup"

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
