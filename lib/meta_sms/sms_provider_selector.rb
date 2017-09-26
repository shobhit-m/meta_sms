module MetaSms

  # This class is to select sms service provider. Requiring of the provider class is also done dynamically.
  # Selection and dynamic require is done on the basis of config variable MetaSms.config.sms_provider_name.
  #
  # @author Shobhit Dixit
  class SmsProviderSelector

    # constant to keep track of sms providers
    # naming convention: keys of SMS_PROVIDERS shall be used in config of meta_sms.rb initializer
    # and value should be same as the name of the class of sms provider.
    # also, the name of the class will be snake cased to require the class file
    # for eg, for smsbox, there is a file named smsbox.rb in providers folder and the name of the class is Smsbox.
    # @author Shobhit Dixit
    SMS_PROVIDERS = {
      :smsbox => "Smsbox"
    }

    #
    # @author Shobhit Dixit
    def initialize
      @sms_provider_class_name = SMS_PROVIDERS[MetaSms.config.sms_provider_name]
      raise ArgumentError.new 'No or wrong provider found. Please add a correct provider name in config/initializers/meta_sms.rb' if @sms_provider_class_name.blank?
      require "meta_sms/providers/#{@sms_provider_class_name.underscore}"
    end

    def provider_class
      (eval @sms_provider_class_name)
    end

  end
end
