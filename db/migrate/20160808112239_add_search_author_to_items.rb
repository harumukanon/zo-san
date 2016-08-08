class AddSearchAuthorToItems < ActiveRecord::Migration
  def change
    add_column :items, :search_author, :string
  end
end
