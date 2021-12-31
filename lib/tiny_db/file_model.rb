require 'json'
require './lib/tiny_db/db_interface.rb'
module TinyDb
  class FileModel

    def save
      id.nil? ? create_record : update_record

      self.class.write_to_file
    end

    def update(hash)
      self.class::ATTRIBUTES.each do |attr|
        self.instance_variable_set("@#{attr.to_s}", hash[attr]) if hash.keys.include?(attr)
      end

      self.save
    end

    def destroy
      self.class.table.delete_if { |x| x[:id] == id }

      self.class.write_to_file
    end

    private

    def create_record
      @id = self.class.last_index + 1
      data = {"id": @id, "name": @name}

      self.class.table << data
    end

    def update_record
      data = self.class.table.select{|x| x[:id] == id}.first
      data[:name] = name
    end

    class << self
      def all
        file[table_name]
      end

      def find_by(arg)
        klass = self.new

        key = arg.keys.first
        value = arg.values.first

        data = table.select{|x| x[key] == value}.first

        self::ATTRIBUTES.each do |attr|
          klass.instance_variable_set("@#{attr.to_s}", data[attr])
        end

        klass
      end

      def create(params)
        klass = self.new

        self::ATTRIBUTES.each do |attr|
          klass.instance_variable_set("@#{attr.to_s}", params[attr])
        end

        klass.save
      end

      def file
        @file ||= load_file
      end

      def table_name
        self::TABLE_NAME
      end

      def table
        file[table_name] = [] if file[table_name].nil?

        file[table_name]
      end

      def last_index
        latest_record = table.sort_by{|x| x[:id]}.last

        latest_record.nil? ? 0 : latest_record[:id]
      end

      def write_to_file
        TinyDb::DbInterface.write(file)
      end

      def load_file
        TinyDb::DbInterface.read
      end

    end

  end
end
