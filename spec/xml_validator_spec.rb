# frozen_string_literal: true

require 'spec_helper'

RSpec.describe XrechnungXmlValidator::XmlValidator do
  describe 'validate_and_create_report!' do
    subject do
      described_class.new(absolute_path:, output_directory:).validate_and_create_report!
    end

    context 'xml is valid' do
      let(:absolute_path) { absolute_path_valid_xml }

      it 'creates html report' do
        subject

        expect(File.exist?(absolute_path_valid_xml_report)).to be_truthy
      end
    end

    context 'xml is not valid' do
      let(:absolute_path) { absolute_path_invalid_xml }

      it 'creates html report' do
        expect { subject }.to raise_error(XrechnungXmlValidator::InvalidXrechnung)

        expect(File.exist?(absolute_path_invalid_xml_report)).to be_truthy
      end
    end
  end

  def absolute_path_valid_xml_report
    [XrechnungXmlValidator::FilePaths.pwd, 'spec/support/valid-report.html'].join('/')
  end

  def absolute_path_invalid_xml_report
    [XrechnungXmlValidator::FilePaths.pwd, 'spec/support/invalid-report.html'].join('/')
  end

  def absolute_path_valid_xml
    [XrechnungXmlValidator::FilePaths.pwd, 'spec/support/xmls/valid.xml'].join('/')
  end

  def absolute_path_invalid_xml
    [XrechnungXmlValidator::FilePaths.pwd, 'spec/support/xmls/invalid.xml'].join('/')
  end

  def output_directory
    [XrechnungXmlValidator::FilePaths.pwd, 'spec/support'].join('/')
  end
end
