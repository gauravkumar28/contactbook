class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :contact_id
      t.string :integer

      t.timestamps
    end
  end
end
