class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :business_name
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
