# frozen_string_literal: true

module XrechnungXmlValidator
  class FilePaths
    class << self
      VERSION = '1_6_3'.freeze

      def pwd
        `pwd`.gsub("\n", '')
      end

      def xrechnung_validator_directory
        [XrechnungXmlValidator::FilePaths.pwd, "xrechnung_validator/#{VERSION}"].join('/')
      end

      def xrechnung_validator_jar
        [XrechnungXmlValidator::FilePaths.pwd, "xrechnung_validator/#{VERSION}/validationtool.jar"].join('/')
      end

      def xrechnung_validator_scenarios
        [XrechnungXmlValidator::FilePaths.pwd, "xrechnung_validator/#{VERSION}/scenarios.xml"].join('/')
      end
    end
  end
end
