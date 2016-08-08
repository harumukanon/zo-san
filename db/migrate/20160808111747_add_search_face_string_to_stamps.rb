class AddSearchFaceStringToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :search_face_string, :string
  end
end
