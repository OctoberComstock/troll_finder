class CreateTrolls < ActiveRecord::Migration
  def change
    create_table :trolls do |t|
      t.integer :line
      t.text :data

      t.timestamps null: false
    end
  end
end
