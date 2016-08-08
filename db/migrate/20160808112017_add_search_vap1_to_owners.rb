class AddSearchVap1ToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :search_vap1, :string
  end
end
