class AddMapIdToTroll < ActiveRecord::Migration
  def change
    add_column :trolls, :map_id, :integer
  end
end
