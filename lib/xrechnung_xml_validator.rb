# frozen_string_literal: true

require 'xrechnung_xml_validator/version'
require 'xrechnung_xml_validator/file_paths'
require 'xrechnung_xml_validator/file_validator'
require 'xrechnung_xml_validator/xml_validator'

module XrechnungXmlValidator
  class FileNotFound      < StandardError; end
  class InvalidFileFormat < StandardError; end
  class InvalidXrechnung  < StandardError; end
end
