# frozen_string_literal: true

require "spec_helper"

RSpec.describe ZedTestToggle::Project do
  subject { described_class.new(root) }

  let(:root) { "root" }

  it { is_expected.to be_a(ZedTestToggle::Project) }

  describe "root" do
    subject { described_class.new(root).root }

    it { is_expected.to eq(root) }

    context "when it has a trailing slash" do
      let(:root) { "root/" }

      it { is_expected.to eq("root") }
    end
  end

  describe "#src_paths" do
    subject { described_class.new(root).src_paths }

    it { is_expected.to be_a(Array) }

    context "when the project is a gem" do
      before { allow_any_instance_of(described_class).to receive(:gem?).and_return(true) }

      it { is_expected.to include("lib", "") }
    end

    context "when the project is not a gem" do
      it { is_expected.to include("app", "lib") }
    end
  end

  describe "#test_paths" do
    subject { described_class.new(root).test_paths }

    before { allow_any_instance_of(described_class).to receive(:test_anchor).and_return("test_anchor") }

    let(:lib_path) { File.join("test_anchor", "lib") }

    it { is_expected.to be_a(Array) }

    it { is_expected.to include("test_anchor", lib_path) }
  end

  describe "#test_anchor" do
    subject { described_class.new(root).test_anchor }

    context "when the project uses rspec" do
      before { allow_any_instance_of(described_class).to receive(:spec?).and_return(true) }

      it { is_expected.to eq("spec") }
    end

    context "when the project uses minitest" do
      before { allow_any_instance_of(described_class).to receive(:spec?).and_return(false) }

      it { is_expected.to eq("test") }
    end
  end

  describe "#test_regexes" do
    subject { described_class.new(root).test_regexes }

    context "when the project uses rspec" do
      before { allow_any_instance_of(described_class).to receive(:spec?).and_return(true) }

      it { is_expected.to be_a(Array) }
      it { is_expected.to include(/_spec\.rb$/) }
    end

    context "when the project uses minitest" do
      before { allow_any_instance_of(described_class).to receive(:spec?).and_return(false) }

      it { is_expected.to be_a(Array) }
      it { is_expected.to include(/_test\.rb$/, /test_[a-zA-Z0-9_]*\.rb$/) }
    end
  end

  describe "#testify" do
    subject { described_class.new(root).testify(path) }

    let(:path) { "file.rb" }

    context "when the project uses rspec" do
      before { allow_any_instance_of(described_class).to receive(:spec?).and_return(true) }

      it { is_expected.to eq("file_spec.rb") }
    end

    context "when the project uses minitest" do
      before { allow_any_instance_of(described_class).to receive(:spec?).and_return(false) }

      it { is_expected.to eq("file_test.rb") }
    end
  end
end
