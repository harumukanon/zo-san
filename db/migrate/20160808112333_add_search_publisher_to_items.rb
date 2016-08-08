class AddSearchPublisherToItems < ActiveRecord::Migration
  def change
    add_column :items, :search_publisher, :string
  end
end
