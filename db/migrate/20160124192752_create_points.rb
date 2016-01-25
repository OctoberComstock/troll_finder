class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.float :lat
      t.float :long

      t.timestamps null: false
    end
  end
end
