class CreateTimer < ActiveRecord::Migration[5.1]
  def change
    create_table :timers do |t|

    	t.references :user ,foreign_key: true, null: false
    	
    	 t.timestamps null: false
    end
  end
end
