class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :aap
      t.string :vap1
      t.string :vap2
      t.string :vap3
      t.string :history

      t.timestamps null: false
    end
  end
end
