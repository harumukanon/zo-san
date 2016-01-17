class Owner < ActiveRecord::Base
  has_many :ownerships , foreign_key: "owner_id", dependent: :destroy
  has_many :stamps, through: :ownerships
  
  validates :aap, presence: true, length: { maximum: 255 }
  
  attr_accessor :temp_stamp_id
end
