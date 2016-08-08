class AddSearchVap3ToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :search_vap3, :string
  end
end
