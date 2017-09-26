module MetaSms

  # This is an ActiveRecord class. It is used to save sms log in db.
  #
  # @author Shobhit Dixit
  class SmsLogging < ActiveRecord::Base

    # Description of method
    #
    # @param [String] result of .send_sms method in provider class
    # @param [Hash] options provided in ISmsProvider
    # @param [Error] error raised by .send_sms method in provider class
    # @author Shobhit Dixit
    def self.log_sms(result, options, error)
      if ActiveRecord::Base.connection.table_exists? self.table_name
        SmsLogging.create( SmsLogging.get_sms_logging_object(result, options, error) )
      else
        raise StandardError.new "No table exists. Please run 'rails g meta_sms:migrations_for_logger' and then run 'rake db:migrate'. To disable this warning, make config.logging=false, in config/initializers/meta_sms.rb."
      end
    end

    def self.get_sms_logging_object(result, options, error)
      sms_logging_object = {
        message_text: options[:message_text],
        mobile_number: options[:mobile_number],
        error_message: error.try(:message)
      }
      metadata = options[:metadata]
      sms_logging_object[:metadata] = {:response => result}.as_json
      sms_logging_object[:metadata].merge(metadata) if metadata.present?
      sms_logging_object
    end

  end
end
