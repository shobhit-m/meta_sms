module MetaSms

  # This is an ActiveRecord class. It is used to save sms log in db.
  #
  # @author Shobhit Dixit
  class SmsLogging < ActiveRecord::Base

    def self.log_sms(result, options, error)
      SmsLogging.create( SmsLogging.get_sms_logging_object(result, options, error) )
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
