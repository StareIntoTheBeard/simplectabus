class AddStopsAndRouteNumberToBustime < ActiveRecord::Migration
  def change
  	add_column :bustimes, :stopid, :string
  	add_column :bustimes, :routenum, :integer
  end
end
