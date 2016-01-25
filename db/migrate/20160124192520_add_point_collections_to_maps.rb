class AddPointCollectionsToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :point_collection, :string
  end
end
