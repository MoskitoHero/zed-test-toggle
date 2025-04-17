# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(__dir__, "..", "lib"))

require "rspec"
require "simplecov"
require "debug"

# Require all support files
Dir[File.expand_path(File.join("support", "**", "*.rb"), __dir__)].each { |f| require f }

SimpleCov.start do
  add_filter "spec/support"
  add_filter ".bundle"
  add_group "Library", "lib"
  add_group "Specs", "spec"
end

require "zed-test-toggle"

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :rand
end
