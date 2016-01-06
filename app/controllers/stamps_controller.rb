class StampsController < ApplicationController
  
  def show
    @stamp = Stamp.find(params[:id])
  end
  
  def new
    @stamp = Stamp.new
  end
  
  def create
    @stamp = Stamp.new(stamp_params)
    if @stamp.save
      flash[:success] = "蔵書印情報が登録されました"
      redirect_to @stamp
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
