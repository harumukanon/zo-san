class AddTempStampToOwner < ActiveRecord::Migration
  def change
    add_reference :owners, :temp_stamp, index: true
  end
end