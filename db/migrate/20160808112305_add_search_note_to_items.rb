class AddSearchNoteToItems < ActiveRecord::Migration
  def change
    add_column :items, :search_note, :string
  end
end
