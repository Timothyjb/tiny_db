require "tiny_db/version"
require "tiny_db/file_model"
require 'tiny_db/configuration'

module TinyDb
  class ConfigError < StandardError; end

  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def reset
      @configuration = Configuration.new
    end

    def configure
      yield(configuration)
    end

  end

end
