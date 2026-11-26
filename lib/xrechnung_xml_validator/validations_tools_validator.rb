# frozen_string_literal: true

module XrechnungXmlValidator
  class ValidationsToolsValidator
    SCENARIOS_MISSING_ERROR      = 'a scenarios.xml file should be present in xrechnung_validator folder in the root path'.freeze
    VALIDATIONTOOL_MISSING_ERROR = 'a validationtool.jar file should be present in xrechnung_validator folder in the root path'

    def validate!
      validate_scenarios_file_presence!
      validate_validationtool_file_presence!
    end

    private

    def validate_scenarios_file_presence!
      unless File.exist? XrechnungXmlValidator::FilePaths.xrechnung_validator_scenarios
        raise XrechnungXmlValidator::ScenariosMissing.new SCENARIOS_MISSING_ERROR
      end
    end

    def validate_validationtool_file_presence!
      unless File.exist? XrechnungXmlValidator::FilePaths.xrechnung_validator_jar
        raise XrechnungXmlValidator::ValidationtoolMissing.new VALIDATIONTOOL_MISSING_ERROR
      end
    end
  end
end