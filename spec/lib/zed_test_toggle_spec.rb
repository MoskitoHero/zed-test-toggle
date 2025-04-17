# frozen_string_literal: true

require "spec_helper"

RSpec.describe ZedTestToggle do
  describe "VERSION" do
    subject { described_class::VERSION }

    it { is_expected.not_to be_nil }
  end
end
