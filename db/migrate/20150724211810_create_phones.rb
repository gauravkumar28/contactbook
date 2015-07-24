class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :phonenumber
      t.string :contact_id
      t.string :integer

      t.timestamps
    end
  end
end
