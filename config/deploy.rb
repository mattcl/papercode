set :application, 'papercode'
set :repository,  'git@github.com:mattcl/papercode.git'
set :branch, 'master'
set :keep_releases, 5

set :scm, :git
set :scm_verbose, true
set :deploy_via, :remote_cache

set :use_sudo, false
set :ssh_options, { :forward_agent => true }

require 'bundler/capistrano'

set :bundle_flags, '--deployment --binstubs'
set :bundle_without, [:test, :development, :deploy]

default_run_options[:shell] = '/bin/bash --login'

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

set :user, 'deploy'
server 'papercode.net', :web, :app, :db, :primary => true
set :deploy_to, "/home/apps/#{application}"
set :rails_env, 'production'

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end

  task :copy_database_yml do
    run "cp #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
end
