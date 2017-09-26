require "rails_helper"
require 'meta_sms/providers/i_sms_provider'

describe MetaSms::ISmsProvider do
  it ".initialize will initialize ISmsProvider object" do
    i_sms_provider = MetaSms::ISmsProvider.new({})
    expect(i_sms_provider).to be_instance_of(MetaSms::ISmsProvider)
  end

  it ".send_sms will raise NotImplementedError, when called by an object of ISmsProvider" do
    i_sms_provider = MetaSms::ISmsProvider.new({})
    expect {i_sms_provider.send_sms}.to raise_error(NotImplementedError, "send_sms")
  end

  it ".check_required_option will raise ArgumentError, when check_required_option is called by an object of i_sms_provider, if value of :message_text is nil in options" do
    i_sms_provider = MetaSms::ISmsProvider.new({})
    expect {i_sms_provider.check_required_option(:message_text)}.to raise_error(ArgumentError, "No message_text found.")
  end

  it ".check_required_option will return message_text, when check_required_option is called by an object of i_sms_provider, if value of :message_text is present in options" do
    sms = MetaSms::ISmsProvider.new({message_text: 'abc'})
    expect(sms.check_required_option :message_text).to be_eql('abc')
  end

  it ".check_required_option will raise ArgumentError, when check_required_option is called by an object of i_sms_provider, if value of :mobile_number is nil in options" do
    sms = MetaSms::ISmsProvider.new({message_text: 'abc'})
    expect {sms.check_required_option(:mobile_number)}.to raise_error(ArgumentError, "No mobile_number found.")
  end

  it ".check_required_option will return mobile_number, when check_required_option is called by an object of i_sms_provider, if value of :mobile_number is present in options" do
    sms = MetaSms::ISmsProvider.new({mobile_number: '7784566338'})
    expect(sms.check_required_option :mobile_number).to be_eql('7784566338')
  end

end

describe MetaSms::ISmsProvider::REQUIRED_OPTIONS do

  it "will be a Array" do
    expect(MetaSms::ISmsProvider::REQUIRED_OPTIONS).to be_a_kind_of(Array)
  end

  it "Number of required options in the gem" do
    expect(MetaSms::ISmsProvider::REQUIRED_OPTIONS.length).to eql(2)
  end

  it "has message_text and mobile_number only as required options" do
    expect(MetaSms::ISmsProvider::REQUIRED_OPTIONS).to contain_exactly(:message_text, :mobile_number)
  end

end
