require "rails_helper"
require "meta_sms/sms_provider_selector"

module MetaSms
  def self.config
    self
  end
end

describe MetaSms::SmsProviderSelector do
  it "#initialize will raise error if config variable sms_provider_name is not correct" do
    module MetaSms
      def self.sms_provider_name
        ''
      end
    end
    expect{MetaSms::SmsProviderSelector.new}.to raise_error(ArgumentError, 'No or wrong provider found. Please add a correct provider name in config/initializers/meta_sms.rb')
  end

  it "#initialize will raise error if config variable sms_provider_name is not correct" do
    module MetaSms
      def self.sms_provider_name
        'AnyThing'
      end
    end
    expect{MetaSms::SmsProviderSelector.new}.to raise_error(ArgumentError, 'No or wrong provider found. Please add a correct provider name in config/initializers/meta_sms.rb')
  end

  it "#initialize will assign @sms_provider_class_name a value" do
    module MetaSms
      def self.sms_provider_name
        :smsbox
      end
    end
    sms_provider_selector = MetaSms::SmsProviderSelector.new
    expect(sms_provider_selector.instance_variable_get(:@sms_provider_class_name)).to be_eql("Smsbox")
  end
end

describe MetaSms::SmsProviderSelector::SMS_PROVIDERS do
  it "will be a Hash" do
    expect(MetaSms::SmsProviderSelector::SMS_PROVIDERS).to be_a_kind_of(Hash)
  end

  it "Number of sms providers" do
    expect(MetaSms::SmsProviderSelector::SMS_PROVIDERS.keys.length).to be_eql(1)
  end

  it "will have sms providers" do
    expect(MetaSms::SmsProviderSelector::SMS_PROVIDERS.keys).to contain_exactly(:smsbox)
  end
end
