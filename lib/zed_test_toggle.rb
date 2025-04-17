# frozen_string_literal: true

require "forwardable"
require "thor"

require_relative "zed_test_toggle/version"
require_relative "zed_test_toggle/cli/cli"

module ZedTestToggle
  autoload :Project, "zed_test_toggle/project"
  autoload :SourceFile, "zed_test_toggle/source_file"
end
