class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :icon_url
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
