MetaSms.configure do |config|

  # This gem is a wrapper to use smsbox api in rails to send sms.


  # make this true if logging is required
  # also run 'rails g meta_sms:migrations_for_logger' in order to add migrations for sms logger
  # currently this gem supports only pg adapter for database
  config.logging = false

  # if logging is set true, you can add a default resource type in the logging table
  # it can be a user, or company etc.
  # set a default resource type
  # config.resource_type = 'User'

  # config.sms_box_user_name = ''
  # config.sms_box_key = ''
  # config.sms_route = 'Transactional'
  # config.sms_from = 'tpohub'
  # config.sms_type = 'TextSMS'


end
