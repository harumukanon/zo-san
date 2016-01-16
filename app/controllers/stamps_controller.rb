class StampsController < ApplicationController
  before_action :set_stamp, only: [:show, :edit, :update, :destroy, :remove_image]
  before_action :authenticate_editor!, only: [:edit, :update, :destroy, :remove_image]
  
  def show
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

  def edit
  end
  
  def update
      if @stamp.update(stamp_params)
        flash[:success] = "蔵書印情報が変更されました"
        redirect_to @stamp
      else
        #保存に失敗した場合は編集画面に戻す
        flash[:danger] = "蔵書印情報の変更に失敗しました"
        render 'edit'
      end
  end
  
  def destroy
      if @stamp.destroy
        flash[:success] = "蔵書印情報が削除されました"
        redirect_to root_path
      else
        flash[:danger] = "蔵書印情報の削除に失敗しました"
        render 'show'
      end
  end
  
  def remove_image
    @stamp.stamp_image =""
    @stamp.save!
    redirect_to stamp_path(@stamp), info: "画像を削除しました"
  end
  
  private
  
  def set_stamp
    @stamp = Stamp.find(params[:id])
  end

  def stamp_params
    params.require(:stamp).permit(:face_string, :stamp_image, :image_source,
                                 :note)
  end
end
