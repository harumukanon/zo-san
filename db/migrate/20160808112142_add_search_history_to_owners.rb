class AddSearchHistoryToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :search_history, :string
  end
end
