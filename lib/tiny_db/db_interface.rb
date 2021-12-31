module TinyDb
  class DbInterface
    class << self

      def write(file)
        check_setup_completion
        File.write("#{db_file_path}", file.to_json)
      end

      def read
        check_setup_completion
        JSON.load File.open("#{db_file_path}", "r")
      end

      private

      def db_file_path
        @db_file_path ||= TinyDb.configuration.db_file_path
      end

      def check_setup_completion
        raise_missing_config_error if db_file_path.nil?
        raise_missing_file_error unless file_exists?
      end

      def raise_missing_config_error
        raise ConfigError.new("required config 'db_file_path' is missing")
      end

      def file_exists?
        File.file?("#{db_file_path}")
      end

      def raise_missing_file_error
        raise ConfigError.new("the db file '#{db_file_path}' is missing")
      end

    end
  end
end
