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
  converter = Itaiji::Converter.new
  keyword = params[:keyword]
    unless keyword.nil?
      keyword_itai = converter.convert_itaiji(keyword.clone)
      keyword_seiji = converter.convert_seijitai(keyword.clone)
      @items = Item.search(:id_or_title_or_author_or_note_cont_any => [keyword_itai, keyword_seiji]).result
    else
      @items = Item.search(:id_or_title_or_author_or_note_cont => keyword).result
    end
    unless @items.any?
     flash[:danger] = "資料情報が見つかりませんでした。"
     @item = Item.new(temp_stamp_id: params[:stamp_id])
     render 'new'
    end
  end 

  def topsearch
  converter = Itaiji::Converter.new
  keyword = params[:keyword]
    unless keyword.nil?
      keyword_itai = converter.convert_itaiji(keyword.clone)
      keyword_seiji = converter.convert_seijitai(keyword.clone)
      @items = Item.search(:title_or_author_or_note_cont_any => [keyword_itai, keyword_seiji], id_eq: keyword, m: 'or').result
    else
      @items = Item.search(:title_or_author_or_note_cont => keyword).result
    end
    unless @items.any?
     flash[:danger] = "資料情報が見つかりませんでした。"
    end
  end
  
private

  def set_stamp
    @stamp = Stamp.find_by(id: params[:stamp_id])
  end  
  
  def set_item
    @item = Item.find_by(id: params[:id])
  end
  
  def item_params
    params.require(:item).permit(:title, :author, :year,
                                 :holding, :note, :temp_stamp_id, :publisher)
  end
  
end
