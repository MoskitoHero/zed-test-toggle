# frozen_string_literal: true

$LOAD_PATH.unshift File.join(__dir__, "lib")

require "bundler/gem_tasks"

begin
  require "rspec/core/rake_task"

  RSpec::Core::RakeTask.new do |spec|
    spec.pattern = "spec/**/*_spec.rb"
  end
rescue LoadError
  nil
end
