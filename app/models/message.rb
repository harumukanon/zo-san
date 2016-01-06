class Message < ActiveRecord::Base
      # 名前は必須入力かつ20文字以内
    validates :name , length: { maximum: 20 } , presence: true
    validates :email , length: { minimum: 3, maximum: 100 } , presence: true
    validates :content , length: { minimum: 2, maximum: 2000 } , presence: true
end
