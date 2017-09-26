require "rails_helper"
require 'meta_sms/providers/smsbox'

describe MetaSms::ISmsProvider do
  it ".initialize will initialize Smsbox object" do
    smsbox = MetaSms::Smsbox.new({})
    expect(smsbox).to be_instance_of(MetaSms::Smsbox)
  end

  it "instance of Smsbox must be able to respond to the methods with name same as of REQ_CONFIG_PARAMS elements" do
    smsbox = MetaSms::Smsbox.new({})
    MetaSms::Smsbox::REQ_CONFIG_PARAMS.each do |param|
      expect(smsbox).to respond_to(param)
    end
  end

  it "instance of Smsbox must be able to respond to the methods with name same as of REQUIRED_OPTIONS elements" do
    smsbox = MetaSms::Smsbox.new({})
    MetaSms::Smsbox::REQUIRED_OPTIONS.each do |param|
      expect(smsbox).to respond_to(param)
    end
  end

end

describe MetaSms::Smsbox::REQ_CONFIG_PARAMS do

  it "will be a Array" do
    expect(MetaSms::Smsbox::REQ_CONFIG_PARAMS).to be_a_kind_of(Array)
  end

  it "Number of required config params for Smsbox in the gem" do
    expect(MetaSms::Smsbox::REQ_CONFIG_PARAMS.length).to eql(4)
  end

  it "has exactly :smsbox_user_name, :smsbox_key, :route, :from " do
    expect(MetaSms::Smsbox::REQ_CONFIG_PARAMS).to contain_exactly(:smsbox_user_name, :smsbox_key, :route, :from)
  end

end

RSpec.describe MetaSms::Smsbox::SMSBOX_PUBLIC_API_URI do
  it "should be equal to" do
    expect(MetaSms::Smsbox::SMSBOX_PUBLIC_API_URI).to be_eql("http://smsbox.in/SecureApi.aspx?")
  end
end
