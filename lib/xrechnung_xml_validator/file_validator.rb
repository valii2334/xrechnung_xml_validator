# frozen_string_literal: true

module XrechnungXmlValidator
  class FileValidator
    attr_reader :absolute_path

    VALID_FORMATS = ['.xml'].freeze

    def initialize(absolute_path:)
      @absolute_path = absolute_path
    end

    def validate!
      raise_file_not_found_error      unless file_exist?
      raise_file_invalid_format_error unless file_valid_format?
    end

    private

    def file_exist?
      File.exist?(absolute_path)
    end

    def file_extname
      File.extname(absolute_path)
    end

    def file_valid_format?
      VALID_FORMATS.include?(file_extname)
    end

    def raise_file_not_found_error
      raise XrechnungXmlValidator::FileNotFound, "#{absolute_path} not found"
    end

    def raise_file_invalid_format_error
      raise XrechnungXmlValidator::InvalidFileFormat, "#{absolute_path} must have format #{VALID_FORMATS.join(', ')}"
    end
  end
end
