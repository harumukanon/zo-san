class AddSearchAapToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :search_aap, :string
  end
end
