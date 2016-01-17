class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_stamp, only: [:show, :new, :search]
  before_action :authenticate_editor!, only: [:edit, :update, :destroy]
  
  def show
  end
  
  def new
    @item = Item.new(temp_stamp_id: params[:stamp_id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item, stamp_id: @item.temp_stamp_id)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
        flash[:success] = "資料情報が変更されました"
        redirect_to @item
    else
        #保存に失敗した場合は編集画面に戻す
        flash[:danger] = "資料情報の変更に失敗しました"
        render 'edit'
    end
  end
  
  def destroy
    if @item.destroy
        flash[:success] = "資料情報が削除されました"
        redirect_to root_path
    else
        flash[:danger] = "資料情報の削除に失敗しました"
        render 'show'
    end
  end  
  
  def search
    keyword = params[:keyword]
    @items = Item.search(:title_or_author_or_note_cont => keyword).result
    unless @items.any?
     flash[:danger] = "資料情報が見つかりませんでした。"
     render 'new'
    end
  end 


private

  def set_stamp
    @stamp = Stamp.find_by(id: params[:stamp_id])
  end  
  
  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:title, :author, :year,
                                 :holding, :note, :temp_stamp_id)
  end
  
end
