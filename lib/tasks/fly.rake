# lib/tasks/fly.rake
# Move db:migrate dependency from release to server for Fly.io

namespace :fly do
  # BUILD step
  task build: "assets:precompile"

  # RELEASE step
  task :release

  # SERVER step
  task server: "db:migrate" do
    sh "bin/rails server"
  end
end
