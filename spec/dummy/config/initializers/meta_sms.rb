MetaSms.configure do |config|

  # This gem is a wrapper to use smsbox api in rails to send sms.


  # make this true if logging is required
  # also run 'rails g meta_sms:migrations_for_logger' in order to add migrations for sms logger
  # currently this gem supports only pg adapter for database
  config.logging = true

  # if logging is set true, you can add a default resource type in the logging table
  # it can be a user, or company etc.
  # set a default resource type
  # config.resource_type = 'User'

  config.sms_provider_name = :smsbox
  config.smsbox_user_name = 'tpohubstaging'
  config.smsbox_key = '6B64F5E0-4EB0-4C8C-AE4F-383F631CD091'
  config.route = 'Transactional'
  config.from = 'tpohub'
  # config.sms_type = 'TextSMS'


end
