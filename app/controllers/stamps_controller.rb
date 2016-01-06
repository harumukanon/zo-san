class StampsController < ApplicationController
  def new
    @stamp = Stamp.new
  end
  
  def create
    @stamp = Stamp.new(stamp_params)
    if @stamp.save
    else
      render 'new'
    end
  end

  private

  def stamp_params
    params.require(:stamp).permit(:face_string, :stamp_image, :image_source,
                                 :note)
  end
end
