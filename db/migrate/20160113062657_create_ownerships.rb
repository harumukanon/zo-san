class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.references :owner, index: true
      t.references :stamp, index: true

      t.timestamps null: false
      
      t.index [:stamp_id, :owner_id], unique: true
    end
  end
end
