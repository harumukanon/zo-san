class AddSearchHoldingToItems < ActiveRecord::Migration
  def change
    add_column :items, :search_holding, :string
  end
end
