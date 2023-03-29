require 'rake'
require_relative 'lib/sapphire/version'

task default: 'all'

task :uninstall do
  system "gem uninstall sapphire"
end

task :build do
  system "gem build sapphire.gemspec"
end

task :install do
  system "gem install sapphire-#{Sapphire::VERSION}.gem"
end

task :test do
  # nothing
end

task :all do
  Rake::Task['uninstall'].invoke
  Rake::Task['build'].invoke
  Rake::Task['install'].invoke
end