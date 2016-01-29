class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_stamp, only: [:edit, :show, :new, :search]
  before_action :authenticate_editor!, only: [:edit, :update, :destroy]
  
  def show
  end
  
  def new
    @item = Item.new(temp_stamp_id: params[:stamp_id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_url(@item, stamp_id: @item.temp_stamp_id)
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
        flash[:success] = "資料情報が変更されました"
        redirect_to item_url(@item) + "?stamp_id=#{params[:stamp_id]}"
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
      @items = Item.search(:code_or_title_or_author_or_note_cont_any => [keyword_itai, keyword_seiji], code_eq: keyword, m: 'or').result
    else
      @items = Item.search(:code_or_title_or_author_or_note_cont => keyword).result
    end
    unless @items.any?
     flash[:danger] = "資料情報が見つかりませんでした。"
     redirect_to new_item_url(stamp_id: @stamp.id)
    end
  end 

  def topsearch
  converter = Itaiji::Converter.new
  keyword = params[:keyword]
    unless keyword.nil?
      keyword_itai = converter.convert_itaiji(keyword.clone)
      keyword_seiji = converter.convert_seijitai(keyword.clone)
      @items = Item.search(:code_or_title_or_author_or_note_cont_any => [keyword_itai, keyword_seiji], code_eq: keyword, m: 'or').result
    else
      @items = Item.search(:code_or_title_or_author_or_note_cont => keyword).result
    end
    unless @items.any?
     flash[:danger] = "資料情報が見つかりませんでした。"
    end
  end
  
private

  def set_stamp
    unless params[:stamp_id].blank?
    @stamp = Stamp.find(params[:stamp_id])
    end
  end  
  
  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:title, :author, :year,
                                 :holding, :note, :temp_stamp_id, :publisher, :code)
  end
  
end
