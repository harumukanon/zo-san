class AddSearchTitleToItems < ActiveRecord::Migration
  def change
    add_column :items, :search_title, :string
  end
end
