## Installation
`gem 'meta_sms'`  
or via github  
`gem 'meta_sms', :git => "https://github.com/shobhit-m/meta_sms", :branch => "master"`  
  
To add initializer, run  
`rails g meta_sms:install`  
This will add an initializer file, config/initializers/meta_sms.rb  
If you want to add sms logging migration,(optional)  
`rails g meta_sms:migrations_for_logger`  
After this, run rake db:migrate  


## Usage  
First, configure meta_sms.rb.  
```
MetaSms.configure do |config|
  config.logging = true

  config.sms_provider_name = :smsbox
  config.smsbox_user_name = ''
  config.smsbox_key = ''
  config.route = ''
  config.from = ''
  config.sms_type = 'TextSMS'


end
```
Then in your application,
```
options = {  
:message_text => "Sample message to send",  
:mobile_number => "9982455678",  
:logging => true,
:metadata => {:key => value}  
}
MetaSms.send_sms(options)
```
`options[:message_text]` and `options[:mobile_number]` are the only required fields in the options hash.  
`options[:logging]` is an optional field. In gem, to check whether to log sms in database or not, we use `options[:logging] == true or config.logging==true`.  
`options[metadata]` is also optional field in which any data regarding sms process can be store as json format.
