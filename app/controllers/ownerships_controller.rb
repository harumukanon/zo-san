class OwnershipsController < ApplicationController

  def create
    @owner = Owner.find(params[:owner_id])
    @stamp = Stamp.find(params[:stamp_id])
    @stamp.owned_by(@owner)
  end

  def destroy
    @ownership = Ownership.find(params[:id])
    @stamp = @ownership.stamp
    @owner = @ownership.owner
    @stamp.not_owned_by(@owner)
  end
end
