class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :stamp, index: true
      t.references :item, index: true

      t.timestamps null: false
      
      t.index [:stamp_id, :item_id], unique: true
    end
  end
end