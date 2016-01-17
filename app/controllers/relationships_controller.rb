class RelationshipsController < ApplicationController
    
  def create
    @item = Item.find(params[:item_id])
    @stamp = Stamp.find(params[:stamp_id])
    @stamp.stamped_at(@item)
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @stamp = @relationship.stamp
    @item = @relationship.item
    @stamp.not_stamped_at(@item)
  end    
    
end
