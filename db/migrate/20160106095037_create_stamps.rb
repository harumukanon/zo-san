class CreateStamps < ActiveRecord::Migration
  def change
    create_table :stamps do |t|
      t.string :stamp_image
      t.string :image_source
      t.string :face_string
      t.string :note

      t.timestamps null: false
    end
  end
end
