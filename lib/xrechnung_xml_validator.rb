# frozen_string_literal: true

require 'xrechnung_xml_validator/version'
require 'xrechnung_xml_validator/jar_integrity_validator'
require 'xrechnung_xml_validator/file_paths'
require 'xrechnung_xml_validator/file_validator'
require 'xrechnung_xml_validator/xml_validator'

module XrechnungXmlValidator
  class FileNotFound         < StandardError; end
  class InvalidFileFormat    < StandardError; end
  class InvalidXrechnung     < StandardError; end
  class InvalidValidationJar < StandardError; end

  class Validate
    attr_reader :absolute_xml_path, :absolute_output_directory_path

    def initialize(absolute_xml_path:, absolute_output_directory_path:)
      @absolute_xml_path              = absolute_xml_path
      @absolute_output_directory_path = absolute_output_directory_path
    end

    def run!
      XrechnungXmlValidator::JarIntegrityValidator.validate!
      XrechnungXmlValidator::FileValidator
        .new(absolute_path: absolute_xml_path).validate!
      XrechnungXmlValidator::XmlValidator
        .new(
          absolute_path: absolute_xml_path,
          output_directory: absolute_output_directory_path
        ).validate_and_create_report!
    end
  end
end
