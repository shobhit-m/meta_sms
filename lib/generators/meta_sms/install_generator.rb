require 'rails/generators'
require 'rails/generators/active_record'

module MetaSms


    # This creates MetaSms initializer for your application
    # It will copy the config file template in config/initializers/meta_sms.rb
    # 
    # @author Shobhit Dixit
    class InstallGenerator < ::Rails::Generators::Base
      include ::Rails::Generators::Migration
      source_root File.expand_path("../templates", __FILE__)
      desc "Creates MetaSms initializer for your application"

      def copy_initializer
        template "meta_sms_initializer.rb", "config/initializers/meta_sms.rb"
      end

    end

end
