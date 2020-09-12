class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :business_name

      t.timestamps null: false
    end
  end
end
