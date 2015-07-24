class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email_url
      t.string :contact_id
      t.string :integer

      t.timestamps
    end
  end
end
