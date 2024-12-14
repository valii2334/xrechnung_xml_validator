# frozen_string_literal: true

module XrechnungXmlValidator
  class JarIntegrityValidator
    VALIDATION_JAR_SHA256_CHECKSUM = '901ef26ddb697687f9c322ddd79e3120ab368da31c04b30c6d0da64f50ad2f40'

    class << self
      def validate!
        return if XrechnungXmlValidator::JarIntegrityValidator.validation_jar_checksum == VALIDATION_JAR_SHA256_CHECKSUM

        raise XrechnungXmlValidator::InvalidValidationJar
      end

      def validation_jar_checksum
        Digest::SHA256.file(XrechnungXmlValidator::FilePaths.xrechnung_validator_jar).hexdigest
      end
    end
  end
end
