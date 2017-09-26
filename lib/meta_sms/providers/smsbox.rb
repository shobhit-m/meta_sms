require 'net/http'

module MetaSms

  # This is a sms provider class which inherits ISmsProvider.
  #
  # @author Shobhit Dixit
  class Smsbox < ISmsProvider

    SMSBOX_PUBLIC_API_URI = "http://smsbox.in/SecureApi.aspx?"

    # Smsbox required config params = smsbox_user_name, smsbox_key, route, from
    # Smsbox optional config params = type, logging

    REQ_CONFIG_PARAMS = [:smsbox_user_name, :smsbox_key, :route, :from]

    # Description of method
    # @overide
    # @return [Type] description of returned object
    # @author Shobhit Dixit
    def send_sms
      res = Net::HTTP.get parsed_uri
      case res
      when "Error : Authentication Failed. Please Try Again"
        ProviderUtility.authentication_error
      when "Error : Your balance is low for sending message."
        ProviderUtility.raise_low_balance_exception
      end
      res
    end

    def parsed_uri
      URI.parse(URI.encode(api_url.strip))
    end

    # This method will make an api url
    #
    # @return [String] api_url
    # @author Shobhit Dixit
    def api_url
      "#{SMSBOX_PUBLIC_API_URI}usr=#{smsbox_user_name}&key=#{smsbox_key}&smstype=#{MetaSms.config.type}&to=#{mobile_number}&msg=#{message_text}&rout=#{route}&from=#{from}"
    end


    # This will dynamically generate methods at run time. Method name will be same as the REQ_CONFIG_PARAMS key.
    # These methods are used in .api_url
    #
    # @see ProviderUtility.check_required_config_param
    # @author Shobhit Dixit
    REQ_CONFIG_PARAMS.each do |param|
      define_method "#{param}" do
        ProviderUtility.check_required_config_param param
      end
    end

    # This will dynamically generate methods. Method name will be same as the REQUIRED_OPTIONS key.
    # These methods are used in .api_url
    #
    # @see .check_required_option
    # @author Shobhit Dixit
    REQUIRED_OPTIONS.each do |option|
      define_method "#{option}" do
        check_required_option option
      end
    end

  end
end
