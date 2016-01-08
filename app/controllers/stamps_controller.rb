class StampsController < ApplicationController
  before_action :authenticate_editor!, only: [:edit, :update, :destroy]
  
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

  def edit
    @stamp = Stamp.find(params[:id])
    @editor = Editor.find(params[:id])
    if @editor==current_editor
      render 'edit'
    else
      redirect_to root_path
    end
  end
  
  def update
    @stamp = Stamp.find(params[:id])
    @editor = Editor.find(params[:id])
    if @editor==current_editor
      if @stamp.update(stamp_params)
        flash[:success] = "蔵書印情報が変更されました"
        render 'show'
      else
        #保存に失敗した場合は編集画面に戻す
        flash[:danger] = "蔵書印情報の変更に失敗しました"
        render 'edit'
      end
    else
      # id違いの場合はエラーメッセージを出してトップページへ戻す
      flash[:danger] = "id違いのため蔵書印情報の変更に失敗しました"
      redirect_to root_path
    end
  end
  
  def destroy
    @stamp = Stamp.find(params[:id])
    @editor = Editor.find(params[:id])
    if @editor==current_editor
      if @samp.destroy(stamp_params)
        flash[:success] = "蔵書印情報が削除されました"
        redirect_to root_path
      else
        flash[:danger] = "蔵書印情報の削除に失敗しました"
        render 'show'
      end
    else
      flash[:danger] = "id違いのため蔵書印情報の削除に失敗しました"
      redirect_to root_path
    end
  end
  
  
  private

  def stamp_params
    params.require(:stamp).permit(:face_string, :stamp_image, :image_source,
                                 :note)
  end
end
