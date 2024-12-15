# frozen_string_literal: true

require 'spec_helper'

RSpec.describe XrechnungXmlValidator::FileValidator do
  let(:ext)               { 'mp3' }
  let(:absolute_xml_path) { Faker::File.file_name(dir: 'random/path', ext:) }

  describe 'validate!' do
    subject do
      described_class.new(absolute_xml_path:).validate!
    end

    context 'file is not found' do
      before do
        allow(File).to receive(:exist?).with(absolute_xml_path).and_return(false)
      end

      it 'raises XRechnungValidator::Errors::FileNotFound' do
        expect { subject }.to raise_error(XrechnungXmlValidator::FileNotFound, "#{absolute_xml_path} not found")
      end
    end

    context 'file is found' do
      let(:error_message) do
        "#{absolute_xml_path} must have format #{XrechnungXmlValidator::FileValidator::VALID_FORMATS.join(', ')}"
      end

      before do
        allow(File).to receive(:exist?).with(absolute_xml_path).and_return(true)
      end

      context 'file has a valid format' do
        let(:ext) { 'xml' }

        it 'does not raises XRechnungValidator::InvalidFileFormat' do
          expect { subject }.to_not raise_error
        end
      end

      context 'files does not have a valid format' do
        it 'raises XRechnungValidator::InvalidFileFormat' do
          expect { subject }.to raise_error(XrechnungXmlValidator::InvalidFileFormat, error_message)
        end
      end
    end
  end
end
