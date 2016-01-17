class AddTempStampToOwner < ActiveRecord::Migration
  def change
    add_reference :owners, :temp_stamp, index: true, foreign_key: true
  end
end
