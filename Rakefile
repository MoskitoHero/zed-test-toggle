# frozen_string_literal: true

$LOAD_PATH.unshift File.join(__dir__, "lib")

require "rspec/core/rake_task"

task :default do
  RSpec::Core::RakeTask.new(:spec)
  Rake::Task["spec"].execute
end
