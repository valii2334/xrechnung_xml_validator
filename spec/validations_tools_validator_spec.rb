# frozen_string_literal: true

require 'spec_helper'

RSpec.describe XrechnungXmlValidator::ValidationsToolsValidator do
  describe 'validate!' do
    subject do
      described_class.new.validate!
    end

    before do
      allow(File).to receive(:exist?).with(XrechnungXmlValidator::FilePaths.xrechnung_validator_scenarios).and_return(scenarios_present)
      allow(File).to receive(:exist?).with(XrechnungXmlValidator::FilePaths.xrechnung_validator_jar).and_return(validationtool_present)
    end

    let(:scenarios_present)      { true }
    let(:validationtool_present) { true }

    context 'scenarios' do
      context 'missing' do
        let(:scenarios_present) { false }

        it 'raises scenarios missing error' do
          expect { subject }.to raise_error(XrechnungXmlValidator::ScenariosMissing, XrechnungXmlValidator::ValidationsToolsValidator::SCENARIOS_MISSING_ERROR)
        end
      end
    end

    context 'validation tool' do
      context 'missing' do
        let(:validationtool_present) { false }

        it 'raises scenarios missing error' do
          expect { subject }.to raise_error(XrechnungXmlValidator::ValidationtoolMissing, XrechnungXmlValidator::ValidationsToolsValidator::VALIDATIONTOOL_MISSING_ERROR)
        end
      end
    end
  end
end