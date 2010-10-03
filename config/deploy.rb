default_run_options[:pty] = true

# be sure to change these
set :user, 'gawyn'
set :domain, 'fundidoanegro.net'
set :application, 'fundidoanegro'

# the rest should be good
set :repository,  "gawyn@fundidoanegro.net:git/fundidoanegro.git"
set :deploy_to, "/home/gawyn/fundidoanegro.net"
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false

server domain, :app, :web
role :db, domain, :primary => true

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
