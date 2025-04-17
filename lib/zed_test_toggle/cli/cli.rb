# frozen_string_literal: true

require "thor"

module ZedTestToggle
  # CLI class for ontology translator
  class CLI < Thor
    def self.start(*)
      super
    rescue Thor::InvocationError, ArgumentError, Errno::ENOENT, IOError => exc
      warn String(exc)
      exit(1)
    end

    def self.exit_on_failure?
      true
    end

    desc "lookup", "Find the alternate file"
    method_option :root, type: :string, aliases: "-r", desc: "Project root directory", default: Dir.pwd
    method_option :path, type: :string, aliases: "-p", desc: "Path to file", default: ""
    def lookup
      alternate_file = SourceFile.new(options[:path], root: options[:root]).alternate_file
      system("zed", alternate_file) unless alternate_file.nil?
    end
  end
end
