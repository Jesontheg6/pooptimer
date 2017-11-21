class AddColumnsToTimers < ActiveRecord::Migration[5.1]
  def change
  	add_column :timers, :longitude, :float, default: 0
  	add_column :timers, :latitude, :float, default: 0
  	add_column :timers, :venue, :string
  end
end
