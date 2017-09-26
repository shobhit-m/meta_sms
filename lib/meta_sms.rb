require 'meta_sms/sms_provider_selector'
require 'meta_sms/providers/i_sms_provider'
require 'meta_sms/providers/smsbox'
require 'meta_sms/configuration'
require 'meta_sms/sms_logging'
require 'meta_sms/utility'

# This module is use to send sms through sms providers as sms box.
# It contains a class method #send_sms which takes a hash as argument.
# #send_sms will send sms, log sms if logging is enabled ((in options or config.logging) and migrations_for_logger is generated and migrated.)
# Some inportant classes of module MetaSms are:
# => Config
# Config is for containg the config variables required in the process of sending sms and logging results in db.
# => SmsProviderSelector
# MetaSms#send_sms uses SmsProviderSelector class to select the provider from the given lists of provider in the gem
# on the basis of the configuration variable, sms_provider_name.
# => ISmsProvider
# It acts as an interface for all the providers. So, in order to use sms provider class, we shall create an object
# of sms provider, which in turn use the constructor of ISmsProvider. This constructor takes options as an argument.
# options is a hash in which :message_text and :mobile_number is the required keys. Other optional keys can be
# :logging, :metadata. Here, :message_text will be the message sen to the user with mobile number as :mobile_number.
# :logging represents whether logging of this message is required in the database or not. There is a config variable
# logging, which also determines the same. So, logging will be true, if any of these value is true. :metadata can be
# any json data that client wants to save in the db along with the log.
# => Smsbox
# Smsbox is the sms provider class. It will have a method send_sms, which overrides the method of its parent class, ISmsProvider.
# Smsbox.send_sms will send message if required options and required configuration variable are present else, it will
# raise error. MetaSms#send_sms will rescue the error, write the log and then throw the rescued error.
# @note Here error from sms_logging is not handled.
# => SmsLogging
# This is an active record responsible to log data into database. It will save the sms log into a sms_loggings table.
# SmsLogging#log_sms is the method which does saving job. This method will raise StandardError if
# config.logging or options[:logging] is true and you have not executed, 'rails g meta_sms:migrations_for_logger'.
#
#
# @author Shobhit Dixit
module MetaSms

  # This class method is use to send sms through this gem.
  #
  # @param [Hash] options
  # @example {:message_text* => "Some text message", :mobile_number* => 7894561237, :logging => boolean, :metadata =>json }
  # @note here message_text and mobile_number are required params and others are optional
  #
  # @raise MetaSmsError (for now, only-if balance is low)
  # @raise SecurityError (for when service provider Authentication Failed)
  # @raise StandardError (for when logging is true but no table for sms_loggings)
  # @return [Type] description of returned object
  # @author Shobhit Dixit
  def self.send_sms(options)
    provider_class = SmsProviderSelector.new.provider_class
    pc = provider_class.new(options)
    error = nil
    begin
      result = pc.send_sms
    rescue MetaSmsError => meta_sms_error
      error = meta_sms_error
    rescue SecurityError => security_error
      error = security_error
    end
    # This will raise an standard error if no table is present and logging is true.
    SmsLogging.log_sms(result, options, error) if Utility.logging?(options[:logging])
    raise error if error.present?
    result
  end

end
