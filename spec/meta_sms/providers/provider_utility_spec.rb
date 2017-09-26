require "rails_helper"
require 'meta_sms/providers/provider_utility'

# patch to create stub for config class
# TODO: Check standard way for doing this
module MetaSms
  def self.config
    self
  end
end
# patch to create stub for config class

describe MetaSms::ProviderUtility do
  it "#check_required_config_param will raise ArgumentError, if value of the given config_param is blank" do
    module MetaSms
      def self.logging
        nil
      end
    end

    expect {MetaSms::ProviderUtility.check_required_config_param("logging")}.to raise_error(ArgumentError, "Property logging is not found. Please check required parameters in initializer file (config/initializers/meta_sms.rb).")
  end

  it "#check_required_config_param will raise ArgumentError, if value of the given config_param is blank" do
    module MetaSms
      def self.abcd
        ''
      end
    end

    expect {MetaSms::ProviderUtility.check_required_config_param("abcd")}.to raise_error(ArgumentError, "Property abcd is not found. Please check required parameters in initializer file (config/initializers/meta_sms.rb).")
  end

  it "#check_required_config_param will return the value, if value of the given config_param is present" do
    module MetaSms
      def self.route
        'Transactional'
      end
    end
    expect(MetaSms::ProviderUtility.check_required_config_param "route" ).to be_eql('Transactional')
  end

  it "#raise_error_for_blank_value will raise ArgumentError" do
    expect {MetaSms::ProviderUtility.raise_error_for_blank_value :message_text}.to raise_error(ArgumentError, "No message_text found.")
  end

  it "#raise_low_balance_exception will raise StandardError" do
    expect {MetaSms::ProviderUtility.raise_low_balance_exception}.to raise_error(MetaSms::MetaSmsError, "Your balance is low for sending message.")
  end

  it "#authentication_error will raise SecurityError" do
    expect {MetaSms::ProviderUtility.authentication_error}.to raise_error(SecurityError, "Authentication Failed. Please Try Again.")
  end

end
