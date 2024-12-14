# frozen_string_literal: true

require 'spec_helper'

RSpec.describe XrechnungXmlValidator::JarIntegrityValidator do
  describe 'self.validate!' do
    subject do
      described_class.validate!
    end

    context 'validation jar was replaced' do
      before do
        allow(XrechnungXmlValidator::FilePaths)
          .to receive(:xrechnung_validator_jar)
          .and_return(XrechnungXmlValidator::FilePaths.xrechnung_validator_scenarios)
      end

      it 'raises XrechnungXmlValidator::InvalidValidationJar' do
        expect { subject }.to raise_error(XrechnungXmlValidator::InvalidValidationJar)
      end
    end
  end
end
