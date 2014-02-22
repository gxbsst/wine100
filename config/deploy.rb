require "bundler/capistrano"
set :application, "wine100"
set :scm, :git
set :use_sudo, false
set :branch, "master"
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_via, :remote_cache

set :default_environment, {
 'LANG' => 'en_US.UTF-8'
}

if ENV['RAILS_ENV'] =='production'
  set :application, "Wine100"
  set :default_environment, {
      'PATH' => "/home/deployer/.rbenv/versions/1.9.3-p392/bin/:$PATH"
  }
  server "wine100", :web, :app, :db, primary: true
  set :repository,  "git://github.com/gxbsst/wine100.git"
  set :user, "deployer"
  set :deploy_to, "/home/#{user}/apps/#{application}"
else
  set :default_environment, {
      'PATH' => "/home/deployer/.rbenv/versions/1.9.3-p448/bin/:$PATH"
  }
  set :user, "deployer"
  server "cancer", :web, :app, :db, primary: true
  set :repository,  "git://github.com/gxbsst/wine100.git"
  set :deploy_to, "/home/#{user}/apps/#{application}"
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :setup_config, roles: :app do
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.yml.mysql"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end

  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  task :bundle_install do
    run("cd #{deploy_to}/current; bundle install --path=vendor/gems")
  end

  #task :migration do
    #run("cd #{deploy_to}/current; rake db:migrate ")
  #end

  task :change_tmp do
    run("chmod -R 777 #{current_path}/tmp")
  end
  #after "deploy:finalize_update", "deploy:change_tmp"

end

