class AddMapIdToPoint < ActiveRecord::Migration
  def change
    add_column :points, :map_id, :integer
  end
end
