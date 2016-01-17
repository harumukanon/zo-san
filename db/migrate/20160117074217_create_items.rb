class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :author
      t.string :year
      t.string :holding
      t.string :note

      t.timestamps null: false
    end
  end
end
