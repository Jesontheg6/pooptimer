class AddPhotosToTimer < ActiveRecord::Migration[5.1]
  def change
  	add_column :timers, :photos, :json
  end
end
