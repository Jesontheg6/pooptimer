class AddTimeToTimer < ActiveRecord::Migration[5.1]
  def change
  	add_column :timers, :time, :string
  end
end
