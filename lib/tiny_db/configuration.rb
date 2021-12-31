module TinyDb
  class Configuration
    attr_accessor :db_file_path

    def initialize
      @db_file_path = nil
    end

  end
end

