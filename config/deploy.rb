set :application, "webdictr"
set :repository,  "git://github.com/ntdt/webdictr.git"
set :deploy_to, "/home/project/#{application}"
set :scm, :git
set :deploy_via, :remote_cache
role :app, "people.vnoss.org"
role :web, "people.vnoss.org"
role :db,  "people.vnoss.org"
