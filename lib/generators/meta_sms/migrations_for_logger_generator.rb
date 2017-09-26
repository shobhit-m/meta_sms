require 'rails/generators'
require 'rails/generators/active_record'

module MetaSms

    # This is a generator for SmsLogging migration
    # It Generates (but does not run) a migration to add a sms_loggings table
    #
    # @author Shobhit Dixit
    class MigrationsForLoggerGenerator < ::Rails::Generators::Base
      include ::Rails::Generators::Migration
      source_root File.expand_path("../templates/migrations", __FILE__)
      desc "Generates (but does not run) a migration to add a sms_loggings table"

      def create_migration_file
        migration_template 'create_sms_loggings.rb', 'db/migrate/create_sms_loggings.rb'
      end

      def self.next_migration_number(dirname)
        ::ActiveRecord::Generators::Base.next_migration_number(dirname)
      end

    end

end
