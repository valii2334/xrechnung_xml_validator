# frozen_string_literal: true

module XrechnungXmlValidator
  class FilePaths
    class << self
      def pwd
        `pwd`.gsub("\n", '')
      end

      def xrechnung_validator_directory
        [XrechnungXmlValidator::FilePaths.pwd, 'xrechnung_validator'].join('/')
      end

      def xrechnung_validator_jar
        [XrechnungXmlValidator::FilePaths.pwd, 'xrechnung_validator/validationtool.jar'].join('/')
      end

      def xrechnung_validator_scenarios
        [XrechnungXmlValidator::FilePaths.pwd, 'xrechnung_validator/scenarios.xml'].join('/')
      end
    end
  end
end
