class CreateSmsLoggings < ActiveRecord::Migration
  def change
    create_table :sms_loggings do |t|
      t.string :message_text
      t.string :mobile_number
      t.string :error_message
      t.json :metadata

      t.timestamps
    end
  end

end
