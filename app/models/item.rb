class Item < ActiveRecord::Base
    has_many :relationships , foreign_key: "item_id", dependent: :destroy
    has_many :stamps, through: :relationships
  
    validates :title, presence: true, length: { maximum: 250 }
    validates :note, length: { maximum: 1000 }
    
    attr_accessor :temp_stamp_id
end
