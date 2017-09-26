module MetaSms
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Config.new
    yield(config)
  end

  # TODO: write dynamic attr_accessor. as currently it is written only for smsbox
  class Config
    attr_accessor :sms_provider_name,:logging, :smsbox_user_name, :smsbox_key, :route,:from,:type

    def initialize
      @logging = false
      @type = 'TextSMS'
      @sms_provider_name = nil
      @smsbox_user_name = nil
      @smsbox_key = nil
      @route = nil
      @from = nil
    end
  end
end
