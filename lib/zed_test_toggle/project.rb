# frozen_string_literal: true

module ZedTestToggle
  class Project
    attr_reader :root

    def initialize(root)
      @root = root.delete_suffix("/")
    end

    def src_paths
      if gem?
        ["lib", ""]
      else
        ["app", "lib"]
      end
    end

    def test_paths
      [test_anchor, File.join(test_anchor, "lib")]
    end

    def test_anchor
      spec? ? "spec" : "test"
    end

    def test_regexes
      if spec?
        [/_spec\.rb$/]
      else
        [/_test\.rb$/, /test_[a-zA-Z0-9_]*\.rb$/]
      end
    end

    def testify(path)
      path.gsub(/\.rb$/, test_suffix)
    end

    private

    def test_suffix
      spec? ? "_spec.rb" : "_test.rb"
    end

    def gem?
      Dir.glob(File.join(root, "*.gemspec")).any?
    end

    def spec?
      Dir.glob(spec_clues).any?
    end

    def spec_clues
      [File.join(root, "spec", "spec_helper.rb"), File.join(root, ".rspec"), File.join(root, "**", "spec", "spec_helper.rb")]
    end
  end
end
