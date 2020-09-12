class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.boolean :53friendly

      t.timestamps null: false
    end
  end
end
