# frozen_string_literal: true

require 'spec_helper'

RSpec.describe XrechnungXmlValidator::Validate do
  let(:absolute_xml_path)              { Faker::File.file_name }
  let(:absolute_output_directory_path) { Faker::File.dir }

  it 'has a version number' do
    expect(XrechnungXmlValidator::VERSION).not_to be nil
  end

  describe 'run!' do
    subject do
      described_class
        .new(absolute_xml_path:, absolute_output_directory_path:)
        .run!
    end

    let(:file_validator_double) { double('XrechnungXmlValidator::FileValidator', validate!: true) }
    let(:xml_validator_double)  { double('XrechnungXmlValidator::XmlValidator', validate_and_create_report!: true) }

    before do
      allow(XrechnungXmlValidator::FileValidator)
        .to receive(:new)
        .with(absolute_xml_path:).and_return(file_validator_double)

      allow(XrechnungXmlValidator::XmlValidator)
        .to receive(:new)
        .with(absolute_xml_path:, absolute_output_directory_path:)
        .and_return(xml_validator_double)
    end

    it 'calls all validators with the right arguments' do
      expect(XrechnungXmlValidator::FileValidator)
        .to receive(:new)
        .with(absolute_xml_path:)

      expect(XrechnungXmlValidator::XmlValidator)
        .to receive(:new)
        .with(absolute_xml_path:, absolute_output_directory_path:)

      subject
    end
  end
end
