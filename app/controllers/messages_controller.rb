class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @message = Message.new
  end

	# POST /posts
  # POST /posts.json
  def create
    @message = Message.new(message_params)
      if @message.save

      	# deliverメソッドを使って、メールを送信する
      	NoticeMailer.hello(@message).deliver
        redirect_to root_path, notice: "メッセージを送信しました"
      else
      # 保存に失敗した場合は編集画面へ戻す
        flash.now[:alert] = "メッセージを送信できませんでした"
        render 'index'
      end
  end

	
  
  private
  def message_params
    params.require(:message).permit(:name, :email, :content, :purpose)
  end
end