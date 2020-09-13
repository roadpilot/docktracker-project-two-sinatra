class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.boolean :friendly53
      t.integer :user_id
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
