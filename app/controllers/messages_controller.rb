class MessagesController < ApplicationController
  def index
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'メッセージを送信しました'
    else
      # メッセージが送信できなかった時
      @messages = Message.all
      flash.now[:alert] = "メッセージの送信に失敗しました。"
      render 'index'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :email, :content, :purpose)
  end
end