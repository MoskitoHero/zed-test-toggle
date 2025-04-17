# frozen_string_literal: true

require "spec_helper"

RSpec.describe ZedTestToggle::CLI do
  describe ".exit_on_failure?" do
    subject { described_class.exit_on_failure? }

    it { is_expected.to be true }
  end

  describe ".start" do
    subject { described_class.start }

    it "calls super" do
      expect(Thor).to receive(:start)
      subject
    end

    context "when Thor raises an error" do
      before do
        allow(Thor).to receive(:start).and_raise(Thor::InvocationError.new("msg"))
        allow(described_class).to receive(:warn).with("msg").and_return(nil)
        allow(described_class).to receive(:exit).with(1).and_return(nil)
      end

      it "exits with status code 1" do
        expect(described_class).to receive(:exit).with(1)
        subject
      end

      it "logs the error" do
        expect(described_class).to receive(:warn).with("msg")
        subject
      end
    end
  end
end
