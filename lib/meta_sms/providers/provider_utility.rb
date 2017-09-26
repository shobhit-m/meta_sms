require "meta_sms/meta_sms_error"

module MetaSms

  # This is a utility class for sms providers. This encapsulates some common class methods as
  # => raise_low_balance_exception
  #    This method will be used to raise an exception if the balance in sms service provider account is low.
  #    This method can be called in the respective sms provider class. eg: sms_box.rb.
  # => raise_error_for_blank_value
  #    This method is used to raise ArgumentError. This can be called in the sms_provider_interface (i_sms_provider) in order to raise the exception is value of any
  #    required option is blank.
  # => check_required_config_param
  #    This method is used to check presence of required config variables. It can be called in the respective sms provider class. eg: sms_box.rb.
  #
  # @author Shobhit Dixit
  class ProviderUtility

    # This method is used to check presence of required config variables
    #
    # @param [String/Symbol] config_param parameters define in config file
    # @raise ArgumentError if the value of the config param is blank
    # @return [Object] Value can be string or an object depending upon the value config variable
    # @author Shobhit Dixit
    def self.check_required_config_param(config_param)
      value = eval "MetaSms.config.#{config_param}"
      if value.blank?
        raise ArgumentError.new "Property #{config_param} is not found. Please check required parameters in initializer file (config/initializers/meta_sms.rb)."
      end
      value
    end

    # This method will raise ArgumentError
    #
    # @param [Symbol/String] key of the @options in i_sms_provider
    # @raise ArgumentError
    # @author Shobhit Dixit
    def self.raise_error_for_blank_value(key)
      raise ArgumentError.new "No #{key} found."
    end

    # This method will raise low balance error
    #
    # @raise StandardError
    # @author Shobhit Dixit
    def self.raise_low_balance_exception
      raise MetaSmsError.new "Your balance is low for sending message."
    end

    # This method will raise authentication error
    #
    # @raise SecurityError
    # @author Shobhit Dixit
    def self.authentication_error
      raise SecurityError.new 'Authentication Failed. Please Try Again.'
    end

  end

end
