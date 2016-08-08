class AddNdlnaToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :ndlna, :string
  end
end
