class OwnersController < ApplicationController
  before_action :set_owner, only: [:show, :edit, :update, :destroy]
  before_action :set_stamp, only: [:show, :new, :search]
  before_action :authenticate_editor!, only: [:edit, :update, :destroy]
  
  def show
  end
  
  def new
    @owner = Owner.new(temp_stamp_id: params[:stamp_id])
  end
  
  def edit
  end
  
  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to owner_path(@owner, stamp_id: @owner.temp_stamp_id)
    else
      render 'new'
    end
  end
  
  def update
    if @owner.update(owner_params)
        flash[:success] = "印主情報が変更されました"
        redirect_to @owner
    else
        #保存に失敗した場合は編集画面に戻す
        flash[:danger] = "印主情報の変更に失敗しました"
        render 'edit'
    end
  end
  
  def destroy
    if @owner.destroy
        flash[:success] = "印主情報が削除されました"
        redirect_to root_path
    else
        flash[:danger] = "印主情報の削除に失敗しました"
        render 'show'
    end
  end
  
  def search
    keyword = params[:keyword]
    @owners = Owner.search(:aap_or_vap1_or_vap2_or_vap3_cont => keyword).result
    unless @owners.any?
     flash[:danger] = "印主情報が見つかりませんでした。"
     redirect_to new_owner_url(stamp_id: @stamp.id)
    end
  end  

  
  private
  
  def set_stamp
    @stamp = Stamp.find_by(id: params[:stamp_id])
  end
  
  def set_owner
    @owner = Owner.find_by(id: params[:id])
  end
  
  def owner_params
    params.require(:owner).permit(:aap, :vap1, :vap2,
                                 :vap3, :temp_stamp_id, :history)
  end
end
