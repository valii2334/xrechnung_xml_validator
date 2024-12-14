# frozen_string_literal: true

require 'spec_helper'

RSpec.describe XrechnungXmlValidator::FilePaths do
  describe 'self.xrechnung_validator_directory' do
    subject do
      described_class.xrechnung_validator_directory
    end

    it 'returns xrechnung_validator directory' do
      expect(Dir.new(subject).children.include?('validationtool-1.5.0-standalone.jar')).to be_truthy
    end
  end

  describe 'self.xrechnung_validator_jar' do
    subject do
      described_class.xrechnung_validator_jar
    end

    it 'returns validation jar' do
      expect(File.basename(subject)).to eq('validationtool-1.5.0-standalone.jar')
    end
  end

  describe 'self.xrechnung_validator_scenarios' do
    subject do
      described_class.xrechnung_validator_scenarios
    end

    it 'returns scenarios.xml' do
      expect(File.basename(subject)).to eq('scenarios.xml')
    end
  end
end
