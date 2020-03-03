require "bundler/gem_tasks"
task :default => :smoke

task :smoke do
  require 'pathname'
  bad = Pathname('smoke/bad-rubocop.yml')
  good = Pathname('smoke/good-rubocop.yml')

  next if `rubocop-configuration_cleaner #{bad}` == good.read

  system "git diff --no-index #{good} #{bad}"
  fail
end
