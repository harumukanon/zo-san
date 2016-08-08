class AddSearchNoteToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :search_note, :string
  end
end
