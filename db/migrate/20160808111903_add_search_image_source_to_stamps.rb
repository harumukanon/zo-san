class AddSearchImageSourceToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :search_image_source, :string
  end
end
