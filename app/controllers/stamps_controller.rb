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
    @stamp.remove_stamp_image!
    @stamp.save!
    redirect_to stamp_path(@stamp), info: "画像を削除しました"
  end
  
  def search
  converter = Itaiji::Converter.new
  keyword = params[:keyword]
    unless keyword.nil?
      keyword_itai = converter.convert_itaiji(keyword.clone)
      keyword_seiji = converter.convert_seijitai(keyword.clone)
      @stamps = Stamp.search(:face_string_or_note_cont_any => [keyword_itai, keyword_seiji]).result
    else
      @stamps = Stamp.search(:face_string_or_note_cont => keyword).result
    end
    unless @stamps.any?
    flash[:danger] = "蔵書印情報が見つかりませんでした。"
    end
  end
  
  private
  
  def set_stamp
    @stamp = Stamp.find(params[:id])
  end

  def stamp_params
    params.require(:stamp).permit(:face_string, :stamp_image, :image_source,
                                 :note, :remove_stamp_image, :search_face_string, :search_note, :search_image_source)
  end
end
