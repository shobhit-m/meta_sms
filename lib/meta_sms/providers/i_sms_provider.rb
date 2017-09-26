require 'meta_sms/providers/provider_utility'

module MetaSms

  # ISmsProvider acts as an interface for all sms providers in this gem.
  # It has a method send_sms, which every sms provider class must override or else error will be thrown.
  # There is a constant REQUIRED_OPTIONS, which represents the required options in order to send message.
  # for now, message_text and mobile_number is the only options that are required.
  # 
  #
  # => 'Sms provider class' refers to the class which is a sms service provider and which inherits ISmsProvider. eg: providers/sms_box.rb
  # @author Shobhit Dixit
  class ISmsProvider

    REQUIRED_OPTIONS = [:message_text, :mobile_number]

    # Initialize options
    #
    # @param [Hash] options
    # @example {:message_text* => "Some text message", :mobile_number* => 7894561237, :logging => boolean, :metadata =>json }
    # @note here message_text and mobile_number are required params and others are optional
    # @author Shobhit Dixit
    def initialize(options)
      @options = options
    end

    # Method to overide in every sms provider class in order to send sms
    #
    # @raise NotImplementedError
    # @author Shobhit Dixit
    def send_sms
      raise NotImplementedError, "send_sms"
    end

    # This method checks the presence of the value of the required options key
    # This is called in sms provider class.
    #
    # @param [Symbol] required_option_key one of the keys of @options whose presence needs to be checked.
    # @return [Object] returned object can be string or object depending upon the value of the key in @options.
    # @author Shobhit Dixit
    def check_required_option(required_option_key)
      value = @options[required_option_key]
      if value.blank?
        ProviderUtility.raise_error_for_blank_value(required_option_key)
      else
        value
      end
    end

    def check_for_valid_mobile_number(mobile_number)
      mobile_number
    end

  end

end
