# frozen_string_literal: true

require 'xrechnung_xml_validator/version'
require 'xrechnung_xml_validator/file_validator'

module XrechnungXmlValidator
  class FileNotFound      < StandardError; end
  class InvalidFileFormat < StandardError; end
end
