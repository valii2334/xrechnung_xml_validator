# frozen_string_literal: true

module XrechnungXmlValidator
  class XmlValidator
    attr_reader :absolute_path, :output_directory

    def initialize(absolute_path:, output_directory:)
      @absolute_path    = absolute_path
      @output_directory = output_directory
    end

    def validate_and_create_report!
      raise_xrechnung_error unless valid_xrechnung_xml?
    end

    private

    # jar => which jar executable to use
    # s   => which scenarios to use against the provided xml
    # r   => in which repository we find the validation files
    # h   => xrechnung xml file path
    # o   => output directory for HTML report
    def validation_response
      `
        java -jar #{Shellwords.escape(XrechnungXmlValidator::FilePaths.xrechnung_validator_jar)}       \
             -s   #{Shellwords.escape(XrechnungXmlValidator::FilePaths.xrechnung_validator_scenarios)} \
             -r   #{Shellwords.escape(XrechnungXmlValidator::FilePaths.xrechnung_validator_directory)} \
             -h   #{Shellwords.escape(absolute_path)}                                                  \
             -o   #{Shellwords.escape(output_directory)}
      `
    end

    def raise_xrechnung_error
      raise XrechnungXmlValidator::InvalidXrechnung
    end

    def valid_xrechnung_xml?
      validation_response.include?('Validation successful!')
    end
  end
end
