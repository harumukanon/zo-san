class AddSearchVap2ToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :search_vap2, :string
  end
end
