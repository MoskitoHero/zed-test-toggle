# frozen_string_literal: true

module ZedTestToggle
  class SourceFile
    extend Forwardable

    def initialize(filename, root:)
      @filename = filename
      @project = Project.new(root)
    end

    def_delegators :@project, :src_paths, :test_paths, :root, :test_regexes, :testify

    def alternate_file
      test_file? ? find_alternate_src : find_alternate_test
    end

    private

    attr_reader :filename, :project

    def test_file?
      test_regexes.any? do |regex|
        filename.match?(regex)
      end
    end

    def find_alternate_src
      src_paths.each do |path|
        test_paths.each do |test_path|
          test_regexes.each do |regex|
            target = File.join(root, filename.sub(test_path, path).gsub(regex, ".rb"))
            next unless File.exist?(target)

            return target
          end
        end
      end
      nil
    end

    def find_alternate_test
      test_paths.each do |path|
        src_paths.each do |src_path|
          next if src_path == ""
          target = File.join(root, testify(filename.gsub(src_path, path)))
          next unless File.exist?(target)

          return target
        end
      end
      nil
    end
  end
end
