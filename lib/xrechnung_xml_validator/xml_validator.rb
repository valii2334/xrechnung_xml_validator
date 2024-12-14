# frozen_string_literal: true

module XrechnungXmlValidator
  class XmlValidator
    attr_reader :absolute_path, :output_directory

    def initialize(absolute_path:, output_directory:)
      @absolute_path    = absolute_path
      @output_directory = output_directory
    end

    def validate!
      raise_xrechnung_error unless valid_xrechnung_xml?
    end

    private

    def validation_response
      `java -jar #{XrechnungXmlValidator::FilePaths.xrechnung_validator_jar} -s #{XrechnungXmlValidator::FilePaths.xrechnung_validator_scenarios} -r #{XrechnungXmlValidator::FilePaths.xrechnung_validator_directory} -h #{absolute_path} -o #{output_directory}`
    end

    def raise_xrechnung_error
      raise XrechnungXmlValidator::InvalidXrechnung
    end

    def valid_xrechnung_xml?
      validation_response.include?('Validation successful!')
    end
  end
end
